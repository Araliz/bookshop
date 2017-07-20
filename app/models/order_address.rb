class OrderAddress < ActiveRecord::Base
  belongs_to :order
  validates :first_name, :last_name, :zip_code, :street, :city, presence: true
end
