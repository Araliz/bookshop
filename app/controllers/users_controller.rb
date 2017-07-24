class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def orders
    @orders = current_user.orders.not_in_state(:new).paginate(page: params[:page], per_page: 30)
  end

  def order_show
    @order = current_user.orders.find(params[:order_id])
  end
end
