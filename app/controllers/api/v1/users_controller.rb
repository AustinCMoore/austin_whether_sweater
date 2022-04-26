class Api::V1::UsersController < ApplicationController
  def create
    if params[:password].nil? || params[:password_confirmation].nil? || params[:email].nil?
      render :status => 400 #nil params
    elsif params[:password].empty? || params[:password_confirmation].empty? || params[:email].empty?
      render :status => 400 #empty params
    elsif params[:password] != params[:password_confirmation]
      render :status => 401 #passwords do not match
    elsif User.find_by(email: params[:email])
      render :status => 403 #email duplicate
    else
      user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.base64(10))
      render json: UsersSerializer.new(user)
    end
  end
end
