class Api::V1::LikesController < ApplicationController
  def index
    myPets = current_user.pets
    render json: myPets
  end

  def create
    if Pet.find_by(pet_api_id: params[:pet][:id])
      petId = Pet.find_by(pet_api_id: params[:pet][:id]).id

      if current_user.likes.where(pet_id: petId).length > 0
        render json: { error: 'Pet already favorited!' }
      else
        just_added = Like.create(user_id: current_user.id, pet_id: petId)
        render json: just_added.pet
      end

    else
      newPet = Pet.find_or_create_by(
        pet_api_id: params[:pet][:id],
        name: params[:pet][:name],
        pet_type: params[:pet][:type],
        species: params[:pet][:species],
        age: params[:pet][:age],
        gender: params[:pet][:gender],
        size: params[:pet][:size],
        breeds: params[:pet][:breeds],
        photos: params[:pet][:photos],
        contact: params[:pet][:contact]
      )
      just_added = Like.create(user_id: current_user.id, pet_id: newPet.id)
      render json: just_added.pet
    end
  end

end
