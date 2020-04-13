class Api::V1::LikesController < ApplicationController
  def index
    myPets = current_user.pets
    render json: myPets
  end
end
