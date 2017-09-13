require 'rails_helper'

RSpec.feature "SignUp", type: :feature do

  let!(:user) {create :user}

  scenario "with valid params" do
    sign_up_with(user.username, "test@email.com", "password")
    expect(page).to have_content("already been taken")
  end

  scenario "with taken username" do
    sign_up_with("Test", "test", "password")
    expect(page).to have_content('is invalid')
  end

  scenario "with invalid email" do
    sign_up_with("Test", "test", "password")
    expect(page).to have_content('is invalid')
  end

  scenario "with blank password" do
    sign_up_with("Test", "test@email.com", "")
    expect(page).to have_content('be blank')
  end
end
