class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create #signup
    # byebug
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: :created
    else
      resp = {
        error: user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :city,
      :state,
      :country,
      :postcode
    )
  end

end
