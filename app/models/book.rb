class Book < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: {greater_than: 0.0}
  validates :category, presence: true

  mount_uploader :cover, CoverUploader

  #postgres default doesn't sort .all by id
  default_scope { order('id ASC') }

end
