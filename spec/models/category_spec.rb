require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:name)}
  end

  describe "validations" do
    it {is_expected.to  validate_presence_of(:name)}

    context "no validation book" do
      it { is_expected.to_not be_valid }
    end

    context "validation book" do
      let!(:category) {create :category}
      subject { build :category, category.attributes }
      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do
   it { is_expected.to have_many(:books)}
 end
end
