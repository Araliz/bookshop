require 'rails_helper'

RSpec.feature "Sign In", type: :feature do

  let!(:user) {create :user}
  let!(:admin){create :admin}
  context "as user" do
    background do
      sign_in(user)
    end

    scenario do
      expect(page).to have_content 'Logout'
      expect(page).to have_no_content 'Administration panel'
    end

    scenario do
      visit admin_books_path
      expect(page).to have_current_path(root_path)
    end
  end

  context "as admin" do
    background do
      sign_in(admin)
    end

    scenario do
      expect(page).to have_content 'Logout'
      expect(page).to have_content 'Administration panel'
    end

    scenario do
      visit admin_books_path
      expect(page).to have_current_path(admin_books_path)
    end
  end
end
