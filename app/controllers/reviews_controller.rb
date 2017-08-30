class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(review_params)
    @review.book_id = params[:book_id]
    if @review.save
      redirect_to book_path(params[:book_id]), notice: "Review created!"
    end
  end


  private
  def review_params
    params.require(:review).permit(:content, :title, :rating)
  end
end
