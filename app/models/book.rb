class Book < ActiveRecord::Base
  belongs_to :category
  mount_uploader :cover, CoverUploader
end
