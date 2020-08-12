class ReviewsController < ApplicationController
  def new
    find_restaurant
    @review = Review.new
  end

  def create
    find_restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
