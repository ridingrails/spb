class RatingsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:id])
    @rating = Rating.new
  end

  def create
    params[:rating][:user_id] = current_user.id
    restaurant = params[:restaurant_id]
    params[:rating][:restaurant_id] = params[:restaurant_id].to_i
    @rating = Rating.new(params[:rating])
    if @rating.save!
      redirect_to restaurant_path(restaurant)
    else
      flash[:errors] = @rating.errors.full_messages
      render :new
    end
  end

  def edit
    @rating = Rating.find_by_restaurant_id_and_user_id(params[:restaurant_id], current_user.id)
  end

  def update
    @rating = Rating.find_by_restaurant_id_and_user_id(params[:restaurant_id], current_user.id)
    restaurant = params[:restaurant_id]
    if @rating.update_attributes!(params[:rating])
      redirect_to restaurant_path(restaurant)
    else
      flash[:errors] = @rating.errors.full_messages
      render
    end
  end
end
