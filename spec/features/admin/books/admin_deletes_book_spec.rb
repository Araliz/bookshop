require 'rails_helper'

feature 'Admin deletes books ' do
  let!(:admin) {create :admin}
  let!(:book) {create :book}

  background do
    sign_in(admin)
    expect(page).to have_content 'Logout'
    visit admin_books_path
  end

  scenario do
    find(:xpath, "//a[@title='delete']").click
    expect(page).to have_content 'Book has been deleted'
    expect(page).to have_no_content book.title
  end

end
