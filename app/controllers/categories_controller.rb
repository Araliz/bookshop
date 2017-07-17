class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @books = @category.books.paginate(page: params[:page], per_page: 9)
  end
end
