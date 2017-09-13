require 'rails_helper'

RSpec.describe Admin::BooksController, type: :controller do
  let(:admin) { create :admin }

  before { sign_in admin }
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end
  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #edit' do
    let(:book) { create :book }
    subject { get :edit, id: book.id }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'POST #create' do
    let!(:params) { { book: build(:book).attributes } }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to admin_books_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Book has been created'
      end

      it 'creates book' do
        expect{ subject }.to change(Book, :count).by(1)
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :new
    end
  end
  describe 'PUT #update' do
     let!(:book) { create :book, title: "Test title", price: 20}
     let(:title) { 'New test title' }
     let(:price) { 15 }
     let!(:params) do
       { id: book.id, book: { title: title, price: price } }
     end
     subject { put :update, params }

     context 'success' do
       it { is_expected.to redirect_to admin_books_path }

       it 'flashes info' do
         subject
         expect(flash[:notice]).to eq 'Book has been updated'
       end

       context 'updates book' do
         subject { -> { put :update, params } }

         it { is_expected.to change{ book.reload.title }.to(title) }
         it { is_expected.to change{ book.reload.old_price }.to(book.price) }
       end
     end

     context 'failure' do
       include_context 'record save failure'

       it_behaves_like 'template rendering action', :edit
     end
   end

   describe 'DELETE #destroy' do
     let!(:book) { create :book }
     subject { delete :destroy, id: book.id }

     it { is_expected.to redirect_to admin_books_path }

     it 'flashes info' do
       subject
       expect(flash[:notice]).to eq 'Book has been deleted'
     end

     it 'destroys teacher' do
       expect{ subject }.to change(Book, :count).by(-1)
     end
   end

end
