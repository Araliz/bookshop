require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #about' do
    subject { get :about }

    it_behaves_like 'template rendering action', :about
  end
  
  describe 'GET #contact' do
    subject { get :contact }

    it_behaves_like 'template rendering action', :contact
  end
end
