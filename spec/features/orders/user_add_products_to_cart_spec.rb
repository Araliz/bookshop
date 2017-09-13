require 'rails_helper'

feature 'User add product to cart' do
  let!(:book_1) {create :book}
  let!(:book_2) {create :book}
  let!(:user) {create :user}

  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit root_path
  end
  scenario "should see book list" do
    expect(page).to have_content book_1.title
    expect(page).to have_content book_2.title
  end
  scenario "should add product to cart" do
    within(:xpath, "//div[@id='book-#{book_1.id}']/div[@class='caption']") do
      expect(page).to have_content  book_1.title
      click_link 'Add to cart'
    end
    expect(page).to have_content "1 product for $#{book_1.price}"
  end

end
