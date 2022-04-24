class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.base64(10))
    render json: UsersSerializer.new(user)
    #sad path: email duplicate
    #sad path: email empty

    #sad path: passwords dont match
    #sad path: password empty
    #sad path: password confirmation empty
  end
end
