class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.find_photo(params[:location])
    render json: BackgroundSerializer.new(background)
  end
end
