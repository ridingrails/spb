class RatingsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
  end

  def create
    params[:rating][:user_id] = current_user.id
    params[:rating][:restaurant_id] = params[:restaurant_id]
    @rating = User.new(params[:rating])
    if @rating.save!
      redirect_to restaurant_path(@rating.rated)
    else
      flash[:errors] = @rating.errors.full_messages
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update_attributes!(params[:rating])
      redirect_to rating_url(@rating)
    else
      flash[:errors] = @rating.errors.full_messages
      render :edit
    end
  end
end
