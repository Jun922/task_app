Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :friends, only: [:create, :destroy]
  resources :posts, only: [:index, :create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end
end