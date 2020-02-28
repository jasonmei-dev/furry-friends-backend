class Api::V1::FavoritedPetsController < ApplicationController
  def create
    pet_id = params[:id] # id from API
    favorited_pet = FavoritedPet.create(api_id: pet_id)
    render json: favorited_pet
  end
end
