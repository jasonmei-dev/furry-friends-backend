class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create #signup
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

  def update
    # byebug
    user = User.find_by(id: params[:id])

    if user.update(update_params)
      render json: UserSerializer.new(user)
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

  def update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :city,
      :state,
      :country,
      :postcode
    )
  end

end
