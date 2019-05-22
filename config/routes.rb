Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :houses, only: [:create, :update, :show]
      post '/feature_medium', to: 'ghosts#feature_medium'
      resources :ghosts, only: [:index, :show, :update]
      get '/featured', to: 'houses#featured'
      get '/featuredagent', to: 'ghosts#featured'
      post '/search', to: 'searches#search_site'
      post '/search_properties', to: 'searches#search_properties'
      post '/haunts', to: 'haunts#create_or_destroy'
      #auth:
      post '/login', to: 'auth#create'
      post '/register', to: 'ghosts#create'
      get '/profile', to: 'ghosts#profile'
      post '/recent_search', to: 'searches#recent_search'
      get '/spook_score', to: 'houses#spook_score'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
