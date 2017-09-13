class ShippingType < ActiveRecord::Base
  validates :name, presence: true
  validates :cost, numericality: {greater_than_or_equal_to: 0.0}, presence: true
end
