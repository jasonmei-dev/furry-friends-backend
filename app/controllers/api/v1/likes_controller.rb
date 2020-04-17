class Api::V1::LikesController < ApplicationController
  def index
    likes = current_user.likes.map { |like| LikeSerializer.new(like)}
    render json: likes
  end

  def create
    # byebug
    if Pet.find_by(pet_api_id: params[:pet][:id])
      petId = Pet.find_by(pet_api_id: params[:pet][:id]).id

      if current_user.likes.where(pet_id: petId).length > 0
        render json: { error: 'Pet already favorited!' }
      else
        new_like = Like.create(user_id: current_user.id, pet_id: petId)
        render json: LikeSerializer.new(new_like)
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
      new_like = Like.create(user_id: current_user.id, pet_id: newPet.id)
      render json: LikeSerializer.new(new_like)
    end
  end

  def destroy
    byebug
    likeId = params[:like][:id]
    like = Like.destroy(likeId)
    render json: like
  end

  def show
    like = Like.find_by(id: params[:id])
    render json: LikeSerializer.new(like)
  end
end
