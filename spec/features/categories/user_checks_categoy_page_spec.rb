require 'rails_helper'

feature 'User visit category page' do
  let!(:category_1) {create :category}
  let!(:category_2) {create :category}
  let!(:book_1) {create :book, category: category_1}
  let!(:book_2) {create :book, category: category_2}
  let!(:user) {create :user}
  background do
    sign_in(user)
    expect(page).to have_content 'Logout'
    visit category_path(category_1)
  end
  scenario "should see book with own category" do
    expect(page).to have_content book_1.title
  end
  scenario "should't see book with different category" do
    expect(page).to have_no_content book_2.title
  end
  scenario "should see category sidebar" do
    within "div.list-group" do
      expect(page).to have_content category_2.name
    end
  end
end
