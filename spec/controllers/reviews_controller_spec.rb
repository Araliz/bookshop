require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  describe 'POST #create' do
    let!(:book) {create(:book)}
    let!(:review) {build :review, book: book, user: user}
    let!(:params) { { review: review.attributes , book_id: book.id} }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to book_path(review.book_id) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Review created!'
      end

      it 'creates review' do
        expect{ subject }.to change(Review, :count).by(1)
      end
    end
  end
end
