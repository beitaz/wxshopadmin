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
  resources :skus do
    get 'base', on: :collection
  end
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

    scope :users do
      get 'register', to: 'users#register'  # 绑定手机
      get 'info', to: 'users#info'  # 用户信息(手机绑定)
      get 'browses', to: 'users#browses'  # 所有浏览记录(足迹)
      get 'browsed', to: 'users#browsed'  # 添加浏览记录(足迹)
      get 'unbrowse', to: 'users#unbrowse'  # 删除浏览记录(足迹)
      get 'favorites', to: 'users#favorites'  # 所有收藏
      get 'favorited' => 'users#favorited'  # 添加收藏
      get 'unfavorite' => 'users#unfavorite'  # 取消收藏
      get 'orders' => 'users#orders'  # 我的订单
      get 'shopcart', to: 'users#shopcart'  # 加入购物车
    end

    scope :goods do
      get 'info' => 'goods#info'  # 商品详情
      get 'favorited' => 'goods#favorited'  # 是否收藏
    end

    scope :adverts do
      get 'list' => 'goods#adverts'
    end
    scope :mall do
      get 'discoverList' => 'goods#discovers'
      
      scope :goodsOrder do
        get 'commitData' => 'users#orders'
        get 'getMyOrderList' => 'users#orders'
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
