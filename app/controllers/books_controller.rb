class BooksController < ApplicationController
  def index
    @books = Book.all_books.paginate(page: params[:page], per_page: 9)
  end

  def show
    @book = Book.find(params[:id])
  end
end
