class PlacesController < ApplicationController
    def index
 #     @places = Place.all
 # Item.paginate page: params[:page], per_page: 10”
        @places = Place.order(:id).paginate(:page => params[:page], :per_page =>3)
      end
end
