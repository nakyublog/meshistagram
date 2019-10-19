Rails.application.routes.draw do
  get 'jirous/create'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/index'
  get 'notifications/index'
  get 'microposts/index'
  
  
  get 'jirous/post'
  post 'jirous/word'
  get 'jirous/word', to: 'jirous#search'
  get 'jirous/search'
  post 'jirous/create'
  get 'jirous/shoplist'
  get 'jirous/wordlist'
  delete 'jirous/:id' , to: 'jirous#destroy'

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
  resources :relationships,       only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
end
