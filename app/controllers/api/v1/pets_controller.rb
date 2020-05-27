class Api::V1::PetsController < ApplicationController
  require 'rest-client'
  before_action :get_token

  def index
    page = request.headers[:page]
    url = "https://api.petfinder.com/v2/animals?location=#{current_user.postcode}&sort=distance&page=#{page}"
    headers = { Authorization: "#{@token["token_type"]} #{@token["access_token"]}" }

    response = RestClient.get(url, headers)

    render json: response
  end

  def show
    pet_id = params[:id] # id from API
    url = "https://api.petfinder.com/v2/animals/#{pet_id}"
    headers = { Authorization: "#{@token["token_type"]} #{@token["access_token"]}" }

    response = RestClient.get(url, headers)

    render json: response
  end

  def get_type
    # type = params[:type] # get type through params from frontend
    # page = params[:page]
    type = request.headers[:type]
    page = request.headers[:page]
    url = "https://api.petfinder.com/v2/animals?location=#{current_user.postcode}&sort=distance&type=#{type}&page=#{page}"
    headers = { Authorization: "#{@token["token_type"]} #{@token["access_token"]}" }

    response = RestClient.get(url, headers)

    render json: response
  end

  private

  def get_token
    url = "https://api.petfinder.com/v2/oauth2/token"

    payload = {
      grant_type: 'client_credentials',
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET']
    }

    response = RestClient.post(url, payload)
    @token = JSON.parse(response)
  end
end
