class PlacesController < ApplicationController
    # added in lesson  22 to match lesson code
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @places = Place.order(:id).paginate(:page => params[:page], :per_page =>10)
      end

    def new
      @place = Place.new
      end

    def create
      @place = current_user.places.create(place_params)
      redirect_to root_path
      if @place.valid?  
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end 
      end

    def show
      @place = Place.find(params[:id])
      @comment = Comment.new
      @photo = Photo.new 
    end

    def edit
      @place = Place.find(params[:id])
      if @place.user != current_user
        return render plain: "Only the user who created this item can edit it.", status: :forbidden
      end
    end

    def update
      @place = Place.find(params[:id])
      if @place.user != current_user
        return render plain: "Only the user who created this item can edit it.", status: :forbidden
      end
      @place.update_attributes(place_params)
      if @place.valid?
         redirect_to root_path     
      else
        render :edit, status: unprocessable_entity
      end
    end

    # added in lesson 23
    def destroy
      @place = Place.find(params[:id])
      if @place.user != current_user
        return render plain: "Only the user who added this item can delete it.", status: :forbidden
      end
      @place.destroy
      redirect_to root_path
    end

    private
    def place_params
      params.require(:place).permit(:name, :description, :address)
      end
end
