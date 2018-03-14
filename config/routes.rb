Rails.application.routes.draw do
  get 'startups/index'

  get 'startups/show'

  get 'startups/edit'

  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
