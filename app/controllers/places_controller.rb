class PlacesController < ApplicationController
    # added in lesson  22 to match lesson code
    before_action :authenticate_user!, only: [:new, :create]

    def index
      @places = Place.order(:id).paginate(:page => params[:page], :per_page =>3)
      end

    def new
      @place = Place.new
      end

    def create
      current_user.places.create(place_params)
      redirect_to root_path
      end

    def show
      @place = Place.find(params[:id])
    end

    def edit
      @place = Place.find(params[:id])
      
    end

    def update
      @place = Place.find(params[:id])
      @place.update_attributes(place_params)
      redirect_to root_path
    end

    # added in lesson 23
    def destroy
      @place = Place.find(params[:id])
      @place.destroy
      redirect_to root_path

    end

    private
    def place_params
      params.require(:place).permit(:name, :description, :address)
      end
end
