# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    # registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :users do
    get 'profile', on: :member
  end
  resources :visitors
  resources :goods do
    get 'adverts', on: :collection
    get 'discovers', on: :collection
    get 'recommends', on: :collection
  end

  namespace :api, defaults: { format: :json } do
    post :adverts, to: 'base#adverts'
    post :discovers, to: 'base#discovers'
    post :detail, to: 'base#detail'
    get 'adverts' => 'goods#adverts'
    get 'discovers' => 'goods#discovers'
    get 'recommends' => 'goods#recommends'
    get 'login' => 'base#login'
    get '/' => 'base#debug'
  end
  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
