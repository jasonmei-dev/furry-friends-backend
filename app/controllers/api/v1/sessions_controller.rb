class Api::V1::SessionsController < ApplicationController

  def create #login
    # byebug
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id

        render json: user, status: :ok
      else
        render json: { error: "Invalid Credentials" }, status: :unauthorized
      end
  end

  def get_current_user
    if logged_in?
      render json: current_user
    else
      render json: {error: "Not logged in" }, status: :unauthorized
    end
  end

  def destroy
    session.clear
    render json: { notice: "Sucessfully logged out" }, status: :ok
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
