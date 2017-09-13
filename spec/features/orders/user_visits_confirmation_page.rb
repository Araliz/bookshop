require 'rails_helper'

feature 'User visit confirmation page' do
  let!(:user) {create :user}
  let!(:book) {create :book}
  let!(:shipping_type) {create :shipping_type}
  let!(:address) {create :address, user: user}

  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit root_path
    find(:xpath, "//div[@id='book-#{book.id}']/div[@class='caption']").click_link
    visit edit_cart_path
    click_button 'Confirm'
  end

  scenario do
    expect(page).to have_content "Confirmation"
    expect(page).to have_content "Total price"
    expect(page).to have_content book.title
    expect(page).to have_content("Delivery type: #{shipping_type.name}")
    expect(page).to have_css("//a[@title='accept']")
  end

  scenario do
    find(:xpath, "//a[@title='accept']").click
    expect(page).to have_content "Your order has been placed"
    expect(page).to have_current_path(root_path)

  end

  scenario "logout "do
    logout
    expect(page).to have_current_path(root_path)
  end

end
