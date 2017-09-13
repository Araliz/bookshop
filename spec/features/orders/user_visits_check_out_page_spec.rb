require 'rails_helper'

feature 'User visit check out page' do
  let!(:user) {create :user}
  let!(:book) {create :book}
  let!(:shipping_type) {create :shipping_type}
  let!(:address) {}

  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit root_path
    find(:xpath, "//div[@id='book-#{book.id}']/div[@class='caption']").click_link
    visit edit_cart_path
  end

  scenario do
    expect(page).to have_content "Shipping address"
    expect(page).to have_content('First name')
    expect(page).to have_css("//button[@title='confirm']")

  end

  scenario do
    expect(page.find_field("First name").value).to eq nil
    within ".edit_order" do
      fill_in 'First name', with: 'Test'
      fill_in 'Last name', with: 'User'
      fill_in 'City', with: 'Cracow'
      fill_in 'Zip code', with: '30-001'
      fill_in 'Street', with: 'ul. Kamienna 1'
      fill_in 'Comment', with: 'test comment'
      click_button 'Confirm'
      expect(page).to have_current_path(confirmation_cart_path)
    end
  end


  context "with set address" do
    let!(:address) {create :address, user: user}

    scenario do
      expect(page.find_field("First name").value).to eq address.first_name
      expect(page.find_field("Last name").value).to eq address.last_name

      click_button 'Confirm'
      expect(page).to have_current_path(confirmation_cart_path)

    end
  end

  scenario "logout "do
    logout
    expect(page).to have_current_path(root_path)
  end

end
