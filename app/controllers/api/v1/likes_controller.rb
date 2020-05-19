class Api::V1::LikesController < ApplicationController
  def index
    if current_user
      likes = current_user.likes.map { |like| LikeSerializer.new(like)}
      render json: likes
    else
      render json: []
    end
  end

  def create
    if Pet.find_by(pet_api_id: params[:pet][:id])
      pet_id = Pet.find_by(pet_api_id: params[:pet][:id]).id

      if current_user.likes.where(pet_id: pet_id).length > 0
        render json: { error: 'Pet already favorited!' }
      else
        new_like = Like.create(user_id: current_user.id, pet_id: pet_id)
        render json: LikeSerializer.new(new_like)
      end

    else
      new_pet = Pet.find_or_create_by(
        pet_api_id: params[:pet][:id],
        name: params[:pet][:name],
        pet_type: params[:pet][:type],
        species: params[:pet][:species],
        age: params[:pet][:age],
        gender: params[:pet][:gender],
        size: params[:pet][:size],
        breeds: params[:pet][:breeds],
        photos: params[:pet][:photos],
        primary_photo_cropped: params[:pet][:primary_photo_cropped],
        contact: params[:pet][:contact]
      )
      new_like = Like.create(user_id: current_user.id, pet_id: new_pet.id)
      render json: LikeSerializer.new(new_like)
    end
  end

  def destroy
    like_id = params[:id]
    pet_id = Like.find_by(id: like_id).pet_id
    pet = Pet.find_by(id: pet_id)
    like = Like.destroy(like_id)
    Pet.destroy(pet_id) if pet.likes.count < 1

    render json: LikeSerializer.new(like)
  end

end
