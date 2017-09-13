class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order
  validates :book_id, :order_id, :quantity, :unit_price, :item_name, presence: true

  def full_price
    unit_price * quantity
  end
end
