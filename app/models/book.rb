class Book < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.0}, presence: true
  validates :category_id, presence: true

  mount_uploader :cover, CoverUploader

  #postgres default doesn't sort .all by id
  default_scope { order('id ASC') }

end
