# frozen_string_literal: true

Rails.application.routes.draw do
  resources :discovers
  resources :orders
  resources :settings
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
  resource :setting
  resources :visitors
  resources :businesses
  resources :adverts
  resources :discovers
  resources :goods do
    get 'recommends', on: :collection
  end

  namespace :api, defaults: { format: :json } do
    post :adverts, to: 'base#adverts'
    post :discovers, to: 'base#discovers'
    post :recommends, to: 'base#recommends'
    post :detail, to: 'base#detail'
    get 'adverts' => 'goods#adverts'
    get 'discovers' => 'goods#discovers'
    # get 'login' => 'base#login'
    scope :sms do
      get 'send' => 'base#send_verify'
    end
    scope :wechat do
      get 'jscode2session', to: 'wechat#jscode2session'
    end

    scope :userBrowse do
      get 'add', to: 'users#browsed'
    end
    scope :userCenter do
      get 'register', to: 'users#register'
      get 'getUserInfo', to: 'users#info'
      get 'favorites' => 'users#favorites'
    end
    scope :adverts do
      get 'list' => 'goods#adverts'
    end
    scope :mall do
      get 'discoverList' => 'goods#discovers'
      get 'goods' => 'goods#show'
      scope :goodsOrder do
        get 'commitData' => 'users#orders'
        get 'getMyOrderList' => 'users#orders'
      end
      scope :goodsFavorite do
        get 'goodsIsFavorite' => 'goods#favorited'
        get 'add' => 'goods#favorite'
        get 'delete' => 'goods#cancel'
      end
    end
    scope :home do
      get 'hostGoodsList' => 'goods#recommends'
    end

    get '/' => 'base#debug'
  end
  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
