require 'rails_helper'

feature 'Admin visits books page' do
  let!(:admin) {create :admin}
  let!(:book_1) {create :book}
  let!(:book_2) {create :book}

  background do
    sign_in(admin)
    expect(page).to have_content 'Logout'
    visit admin_books_path
  end
  scenario "should see books list" do
    expect(page).to have_content book_1.title
    expect(page).to have_content book_1.author
    expect(page).to have_content book_1.category.name
    expect(page).to have_content book_1.price
    expect(page).to have_content book_2.title
    expect(page).to have_content book_2.author
    expect(page).to have_content book_2.category.name
    expect(page).to have_content book_2.price
  end

end
