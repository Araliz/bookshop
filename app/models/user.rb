class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :address, dependent: :destroy
  has_many :orders
  has_many :books, through: :orders
  has_many :reviews


  def reviewed_this_book?(book)
    book.reviews.where("user_id = ?", self.id).any?
  end

end
