class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = User.new(params[:restaurant])
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant)
    else
      flash[:errors] = @restaurant.errors.full_messages
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
