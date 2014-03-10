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
    prev_rating = Rating.where(:user_id => current_user.id, :restaurant_id => @restaurant.id) || nil
    @prev_rating = prev_rating[0]
    @current_user = current_user
  end
end
