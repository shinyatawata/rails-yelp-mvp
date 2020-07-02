class ReviewsController < ApplicationController
  before_action :find_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.valid?
      @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
      # redirect_to new_restaurant_review_path(@restaurant)
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
