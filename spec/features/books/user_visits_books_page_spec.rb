require 'rails_helper'

feature 'User visit books page' do
  let!(:book_1) {create :book}
  let!(:book_2) {create :book}
  let!(:category) {create :category}
  let!(:user) {create :user}
  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit books_path
  end
  scenario "should see book list" do
    expect(page).to have_content book_1.title
    expect(page).to have_content book_2.title
  end
  scenario "should see category sidebar" do
    within "div.list-group" do
      expect(page).to have_content category.name
    end
  end
  scenario "search" do
    within "form#book_search" do
      fill_in 'q_title_cont', with: book_1.title
      find(:xpath, '//div[@class="input-group-btn"]/button').click
    end
    expect(page).to have_content book_1.title
    expect(page).to have_no_content book_2.title
  end
end
