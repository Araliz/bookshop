class Admin::BooksController < Admin::BaseController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).paginate(page: params[:page], per_page: 30)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_path, notice: "Book has been created"
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      @book.update_attribute(:old_price, @book.previous_changes[:price][0]) unless @book.previous_changes[:price].nil?
      redirect_to admin_books_path, notice: "Book has been updated"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path, notice: "Book has been deleted"
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :description,
      :category_id,
      :price,
      :old_price,
      :cover,
      :publisher,
      :language
    )
  end
end
