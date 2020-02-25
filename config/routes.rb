Rails.application.routes.draw do
  resources :lists
  resources :favorited_pets
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
