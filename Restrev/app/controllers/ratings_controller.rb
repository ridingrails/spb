class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(params[:rating])
  end

  def show

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
