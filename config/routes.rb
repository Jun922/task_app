Rails.application.routes.draw do
  devise_for :users
  root to: "friends#index"

  resources :users, only: [:edit, :update, :destroy]
  resources :friends, only: [:index, :new, :create]
end
