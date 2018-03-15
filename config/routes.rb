Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  unauthenticated :user do
    root to: 'home#index'
  end

  authenticated :user do
    root to: 'home#feed'
  end

  resources :startups
  resources :founderships
  resources :users
end
