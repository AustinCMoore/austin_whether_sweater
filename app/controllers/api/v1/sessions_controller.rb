class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if params[:email].nil? || params[:password].nil?
      render :status => 400 #nil params
    elsif params[:email].empty? || params[:password].empty?
      render :status => 400 #empty params
    elsif user.nil? #email does not exist
      render :status => 401 #send same response if either fails for security
    elsif user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else #incorrect password
      render :status => 401 #send same response if either fails for security
    end
  end
end
