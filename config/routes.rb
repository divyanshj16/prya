Rails.application.routes.draw do
  resources :posts
  get 'users/show'
  get 'startups/:id/presentations/:p_id' => 'startups#publishThis', as: 'publish_this'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "registrations",
  }


  unauthenticated :user do
    root to: 'home#index'
  end

  authenticated :user do
    root to: 'home#feed'
  end

  get '/verifyInvestor', to: 'home#verifyInvestor'

  resources :startups do
     member do
       get :action
       put :action
       post 'tag', to: "startups#add_tag"
       delete 'tag', to: "startups#delete_tag", constraints: { tag: /[^\/]+/ }
     end
  end

  get "keyword/tokens"

  resources :founderships
  resources :users
  resources :presentations
  get "tag/tokens"
end
