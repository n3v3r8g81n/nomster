class PlacesController < ApplicationController
    def index
      @places = Place.paginate(page: params[:page])
 # Item.paginate page: params[:page], per_page: 10”
 # @places = Place.order(:id).paginate(:page => params[:page], :per_page =>3)
      end

    def new
      @place = Place.new
      end

    def add
      current_user.places.create(place_params)
      redirect_to root_path
      end

    def show
      @place = Place.find(params[:id])
    end

    private
    def place_params
      params.require(:place).permit(:name, :description, :address)
      end
end
