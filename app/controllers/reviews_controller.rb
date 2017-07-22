class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(micropost_params)
    @review.book_id = params[:book_id]
    if @review.save
      redirect_to book_path(params[:book_id]), notice: "Review created!"
    end
  end

  def method_name

  end

  private
  def micropost_params
    params.require(:review).permit(:content, :title, :rating)
  end
end
