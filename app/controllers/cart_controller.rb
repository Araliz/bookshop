class CartController < ApplicationController
  before_filter :authenticate_user!, only: :show
  def show
    @cart = current_cart
  end

  def edit
    user = current_user
    @cart = current_cart
    if @cart.order_address.blank?
      unless user.address.nil?
        @cart.build_order_address(
          last_name: user.address.last_name,
          first_name: user.address.first_name,
          street: user.address.street,
          city: user.address.city,
          zip_code: user.address.zip_code
        )
      else
        @cart.build_order_address
      end
    end
  end

  def update
    @cart = current_cart
    if @cart.update_attributes(cart_attributes)
      @cart.update_attribute(:user, current_user)
      redirect_to confirmation_cart_path
    else
      render action: :edit
    end
  end

  def confirmation
    @cart = current_cart
  end

  def finish
    @cart = current_cart
    @cart.transition_to :confirmed
    session.delete(:order_id)
    flash[:notice] = "Your order has been placed"
    redirect_to root_path
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
  private

    def cart_attributes
      params.require(:order).permit(
        :shipping_type_id,
        :comment,
        :order_address_attributes => [
          :first_name,
          :last_name,
          :city,
          :zip_code,
          :street
        ]
      )
    end

end
