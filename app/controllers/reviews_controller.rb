class ReviewsController < ApplicationController

  before_filter :authenticate_user!

  def new

  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to
    end
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :reviewer_id, :reviewer_type, :content)
  end

end
