module BooksHelper
  def average_rating(book)
    book.reviews.average(:rating).to_f
  end
end
