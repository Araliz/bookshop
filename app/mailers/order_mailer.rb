class OrderMailer < ApplicationMailer

  def order_confirmation(order)
    @order = order

    mail to: order.user.email, subject: "Order confirmation"
  end

  def order_in_progress(order)
    @order = order

    mail to: order.user.email, subject: "Order in progress"
  end

  def order_shipped(order)
    @order = order

    mail to: order.user.email, subject: "Order shipped"
  end

  def order_cancelled(order)
    @order = order

    mail to: order.user.email, subject: "Order canceleed"
  end
end
