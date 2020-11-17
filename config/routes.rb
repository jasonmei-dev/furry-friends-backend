Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :likes
      resources :pets, only: [:index, :show]

      # post '/pets', to: 'pets#get_all'
      get '/get_type', to: 'pets#get_type'
      post '/login', to: 'sessions#create'
      get '/get_current_user', to: 'sessions#get_current_user'
      delete '/logout', to: 'sessions#destroy'
      post '/signup', to: 'users#create'
    end
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
