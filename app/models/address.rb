class Address < ActiveRecord::Base
  belongs_to :user
  validates :first_name, :last_name, :zip_code, :street, :city, presence: true
end
