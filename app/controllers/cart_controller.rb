class CartController < ApplicationController
  before_filter :authenticate_user!, only: :show
  def show
    @cart = current_cart
  end

  def edit
  end

  def confirmation
  end

  def add_book
    order = current_cart_or_create
    book = Book.find(params[:book_id])
    if item = order.line_items.where(book: book).first
      item.quantity += 1
      item.save
    else
      order.line_items.create book: book,
        quantity: 1,
        unit_price: book.price,
        item_name: book.title
    end
    redirect_to :back, notice: "book add to cart"
  end

  def remove_book
    order = current_cart
    book = Book.find(params[:book_id])
    item = item = order.line_items.where(book: book).first
    if item
      item.destroy
    end
    redirect_to :back, notice: "book removed from cart"
  end

end
