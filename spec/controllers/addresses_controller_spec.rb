require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  let!(:user) {create :user}
  before {sign_in user}

  describe 'GET #new' do
    subject { get :new ,user_id: user.id}

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #edit' do
    let(:address) { create :address, user: user}
    subject { get :edit, user_id: user.id, id: address.id }
    it_behaves_like 'template rendering action', :edit
  end

  describe 'POST #create' do
    address = FactoryGirl.build :address
    let!(:params) { { address: address.attributes, user_id: user.id } }
    subject { post :create, params}

    context 'success' do
      it { is_expected.to redirect_to root_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Address updated'
      end

      it 'creates address' do
        expect{ subject }.to change(Address, :count).by(1)
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :new
    end
  end
  
  describe 'PUT #update' do
     let!(:address) { create :address, first_name: "Test name", user: user}
     let(:first_name) { 'New test name' }
     let!(:params) do
       { id: address.id, address: { first_name: first_name }, user_id: user.id}
     end
     subject { put :update, params }

     context 'success' do
       it { is_expected.to redirect_to root_path }

       it 'flashes info' do
         subject
         expect(flash[:notice]).to eq 'Address updated'
       end

       context 'updates address' do
         subject { -> { put :update, params } }

         it { is_expected.to change{ address.reload.first_name }.to(first_name) }
       end
     end

     context 'failure' do
       include_context 'record save failure'

       it_behaves_like 'template rendering action', :new
     end
   end
end
