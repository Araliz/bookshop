require 'rails_helper'

feature 'Admin edits books' do
  let!(:admin) {create :admin}
  let!(:book) {create :book}
  let!(:category) {create :category}

  background do
    sign_in(admin)
    expect(page).to have_content 'Logout'
    visit admin_books_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario "with valid input" do
    find('#book_category_id').find(:xpath, 'option[3]').select_option
    fill_in 'Title', with: "test title"
    click_button 'Update Book'
    expect(page).to have_content 'Book has been updated'
    expect(page).to have_content category.name
    expect(page).to have_content "test title"
  end

end
