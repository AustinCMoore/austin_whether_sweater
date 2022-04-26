class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].nil?
      render :status => 400 #nil params
    elsif params[:location].empty?
      render :status => 400 #nil params
    else
      background = BackgroundsFacade.find_photo(params[:location])
      render json: ImageSerializer.new(background)
    end
  end
end
