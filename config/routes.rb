Rails.application.routes.draw do
  get 'users/index'
  get 'notifications/index'
  get 'microposts/index'
  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,only: [:index, :show, :create, :destroy, :edit] do
  resources :comments, only: [:create] 
  end
  resources :microposts,only: [:index, :show, :create, :destroy, :edit] do
  resources :likes, only: [:create, :destroy]
  end
  resources :notifications, only: :index
end
