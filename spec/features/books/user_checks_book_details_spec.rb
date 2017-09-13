require 'rails_helper'

feature 'User checks book details' do
  let!(:book) {create :book}
  let!(:review) {create :review, book: book}
  let!(:user) {create :user}

  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit books_path
    find(:xpath, "//div[@id='book-#{book.id}']/a").click
  end
  scenario "should see books info" do
    within "div#book-info-top" do
      expect(page).to have_content book.title
      expect(page).to have_content book.author
      expect(page).to have_content book.publisher
      expect(page).to have_content book.price
      expect(page).to have_content book.language
      expect(page).to have_content "Add to cart"
    end
  end
  scenario "should see books description"do
    expect(page).to have_content 'Book info'
    expect(page).to have_content book.description
  end
  scenario "should see review" do
    within "div#review-#{review.id}" do
      expect(page).to have_content review.title
      expect(page).to have_content review.content
      expect(page).to have_css 'div.review-block-rate'
    end
  end

end
