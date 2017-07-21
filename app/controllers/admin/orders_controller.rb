class Admin::OrdersController < Admin::BaseController
  def index
    if params[:state].nil?
      @orders = Order.not_in_state(:complete, :new).paginate(page: params[:page], per_page: 30)
    else
      @orders = Order.in_state(:complete).paginate(page: params[:page], per_page: 30)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.transition_to params[:state]
    redirect_to admin_order_path(@order), notice: "Status changed"
  end
end
