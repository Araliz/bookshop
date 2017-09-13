require 'rails_helper'

feature 'User visit order page' do
  let!(:book) {create :book}
  let!(:user) {create :user}
  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit root_path
    find(:xpath, "//div[@id='book-#{book.id}']/div[@class='caption']").click_link
    visit cart_path
  end

  scenario do
    expect(page).to have_content "Your cart"
    expect(page).to have_css('tr')
    expect(page).to have_css("//a[@title='delete']")
    expect(page).to have_css("//a[@title='check out']")
    expect(page).to have_content book.title
  end

  scenario do
    find(:xpath, "//a[@title='delete']").click
    expect(page).to have_content("book removed from cart")
  end

  scenario "logout "do
    logout
    expect(page).to have_current_path(root_path)
  end

end
