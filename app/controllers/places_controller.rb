class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    places = Place.order(id: :desc)
    array = []
    places.each do |f|
      f_hash = f.as_json
      f_hash[:url] = url_for(f.main_image)
      array.push f_hash
    end
    render json: array
  end

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(places_params)
    if @place.save
      redirect_to places_path
    else
      render 'new'
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.main_image.purge
    place.delete
    redirect_to places_path
  end

  private

  def places_params
    params.require(:place).permit(:title, :main_image, :text)
  end
end
