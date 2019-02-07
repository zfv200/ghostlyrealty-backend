Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :houses
      resources :haunts
      resources :ghosts
      get '/featured', to: 'houses#featured'
      post '/search', to: 'searches#search_site'
      post '/search_properties', to: 'searches#search_properties'

      #auth:
      post '/login', to: 'auth#create'
      post '/register', to: 'ghosts#create'
      get '/profile', to: 'ghosts#profile'
      post '/recent_search', to: 'searches#recent_search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
