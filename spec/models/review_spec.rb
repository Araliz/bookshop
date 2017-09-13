require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:title)}
    it {is_expected.to have_db_column(:content)}
    it {is_expected.to have_db_column(:rating)}
    it {is_expected.to have_db_column(:user_id)}
    it {is_expected.to have_db_column(:book_id)}
  end

  describe "validations" do
    it {is_expected.to  validate_presence_of(:title)}
    it {is_expected.to  validate_presence_of(:content)}
    it {is_expected.to  validate_length_of(:content).is_at_most(300)}
    it {is_expected.to  validate_presence_of(:rating)}
    it {is_expected.to  validate_presence_of(:user_id)}
    it {is_expected.to  validate_presence_of(:book_id)}

    context "no validation review" do
      it { is_expected.to_not be_valid }
    end

    context "validation review" do
      let!(:review) {create :review}
      subject { build :review, review.attributes }
      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do
   it { is_expected.to belong_to(:user)}
   it { is_expected.to belong_to(:book)}
  end
end
