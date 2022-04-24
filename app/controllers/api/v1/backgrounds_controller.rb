class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundsFacade.find_photo(params[:location])
    render json: ImageSerializer.new(background)
  end
end
