class Api::V1::UsersController < ApplicationController
  def create
    if params[:password].empty? || params[:password_confirmation].empty? || params[:email].empty?
      render :status => 400 #empty params
    elsif params[:password] != params[:password_confirmation]
      render :status => 401 #passwords do not match
    else
      user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.base64(10))
      if user.save
        render json: UsersSerializer.new(user)
      else
        render :status => 403 #email duplicate
      end
    end
  end
end
