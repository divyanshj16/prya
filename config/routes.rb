Rails.application.routes.draw do
  get 'startups/index'

  get 'startups/show'

  get 'startups/edit'

  devise_for :users
  root 'home#index'

end
