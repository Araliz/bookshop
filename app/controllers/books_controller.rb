class BooksController < ApplicationController
  def index
    @books = Book.all.paginate(page: params[:page], per_page: 9)
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.all.where(book_id: params[:id])
    @review = current_user.reviews.build if user_signed_in?
  end
end
