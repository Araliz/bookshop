class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  def full_price
    unit_price * qunantity
end
