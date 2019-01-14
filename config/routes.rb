Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :houses
      resources :haunts
      resources :ghosts
      get '/featured', to: 'houses#featured'
      post '/search', to: 'searches#search_site'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end