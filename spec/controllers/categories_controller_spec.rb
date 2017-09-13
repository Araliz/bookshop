require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #show' do
     let(:category) { create :category }
     subject { get :show, id: category.id }

     it_behaves_like 'template rendering action', :show
   end
end
