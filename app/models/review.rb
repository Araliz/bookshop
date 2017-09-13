class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :title, presence: true
  validates :rating, presence: true
  validates :content, presence: true, length: {maximum: 300}
end
