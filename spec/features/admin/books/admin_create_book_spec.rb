require 'rails_helper'

feature 'Admin creates books' do
  let!(:admin) {create :admin}
  let!(:category) {create :category}
  let!(:book) {build :book}

  background do
    sign_in(admin)
    expect(page).to have_content 'Logout'
    visit admin_books_path
    click_on 'Add new book'
  end

  scenario 'with valid input' do
    fill_in 'Title', with: book.title
    fill_in 'Author', with: book.author
    fill_in 'Price', with: book.price
    fill_in 'Publisher', with: book.publisher
    fill_in 'Language', with: book.language
    fill_in 'Description', with: book.description
    select category.name, from: 'Category'
    click_button 'Create Book'
    expect(page).to have_content 'Book has been created'
  end

  scenario 'with invalid input' do
    fill_in 'Title', with: ""
    fill_in 'Author', with: ""
    fill_in 'Price', with: ""
    fill_in 'Publisher', with: ""
    fill_in 'Language', with: ""
    fill_in 'Description', with:""
    click_button 'Create Book'
    expect(page).to have_content "can't be blank", count: 3
    expect(page).to have_content "is not a number"
  end

end
