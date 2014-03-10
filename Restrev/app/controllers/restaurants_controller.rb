class RestaurantsController < ApplicationController

  def index
    if params[:order]
      if ((params[:order] == "name DESC") || (params[:order] == "name ASC"))
        @restaurants = Restaurant.order(params[:order])
      elsif params[:order] == ("count DESC")
        @restaurants = Restaurant.all.sort { |a,b| b.review_count <=> a.review_count }
      elsif params[:order] == ("count ASC")
        @restaurants = Restaurant.all.sort { |a,b| a.review_count <=> b.review_count }
      elsif params[:order] == ("stars DESC")
        @restaurants = Restaurant.all.sort { |a,b| b.avg <=> a.avg }
      elsif params[:order] == ("stars ASC")
        @restaurants = Restaurant.all.sort { |a,b| a.avg <=> b.avg }
      end
    else
      params[:order] = "name DESC"
      @restaurants = Restaurant.order(params[:order])
    end
    render :index
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
