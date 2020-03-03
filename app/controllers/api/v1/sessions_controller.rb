class Api::V1::SessionsController < ApplicationController

  def create #login
    user = User.find_by(email: user_login_params[:user][:email])

    if user && user.authenticate(user_login_params[:user][:password])
        session[:user_id] = user.id
        render json: player, status: :ok
      else
        render json: { error: "Invalid Credentials" }, status: :unauthorized
      end
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end

end
