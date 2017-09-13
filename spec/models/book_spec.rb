require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:title)}
    it {is_expected.to have_db_column(:author)}
    it {is_expected.to have_db_column(:price)}
    it {is_expected.to have_db_column(:old_price)}
    it {is_expected.to have_db_column(:category_id)}
    it {is_expected.to have_db_column(:description)}
    it {is_expected.to have_db_column(:publisher)}
    it {is_expected.to have_db_column(:language)}
  end

  describe "validations" do
    it {is_expected.to  validate_presence_of(:title)}
    it {is_expected.to  validate_presence_of(:author)}
    it {is_expected.to  validate_presence_of(:price)}
    it {is_expected.to  validate_numericality_of(:price).is_greater_than_or_equal_to(0.0)}
    it {is_expected.to  validate_presence_of(:category_id)}

    context "no validation book" do
      it { is_expected.to_not be_valid }
    end

    context "validation book" do
      let!(:book) {create :book}
      subject { build :book, book.attributes }
      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do
   it { is_expected.to have_many(:reviews).dependent(:destroy) }
   it { is_expected.to belong_to(:category)}
  end
end
