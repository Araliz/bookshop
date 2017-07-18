class Book < ActiveRecord::Base
  belongs_to :category
  mount_uploader :cover, CoverUploader
  scope :all_books, -> {order('id ASC')} #postgres default doesn't sort .all by id

end
