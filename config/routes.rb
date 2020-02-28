Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :lists
      resources :favorited_pets
      resources :users
      get '/pets', to: 'petfinder#index'
      get '/pets/:id', to: 'petfinder#pet_details'
      get '/:type', to: 'petfinder#get_type'
    end
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
