require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #show' do
    let(:book) { create :book }
    subject { get :show, id: book.id }

    it_behaves_like 'template rendering action', :show
  end
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end
end
