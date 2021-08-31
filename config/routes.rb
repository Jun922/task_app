Rails.application.routes.draw do
  devise_for :users
  root to: "friends#index"

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :friends, only: [:index, :create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end
end