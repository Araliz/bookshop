require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:book_id)}
    it {is_expected.to have_db_column(:order_id)}
    it {is_expected.to have_db_column(:quantity)}
    it {is_expected.to have_db_column(:unit_price)}
    it {is_expected.to have_db_column(:item_name)}
  end
  describe "validations" do
    it {is_expected.to  validate_presence_of(:book_id)}
    it {is_expected.to  validate_presence_of(:order_id)}
    it {is_expected.to  validate_presence_of(:quantity)}
    it {is_expected.to  validate_presence_of(:unit_price)}
    it {is_expected.to  validate_presence_of(:item_name)}

    context "no validation line item" do
      it { is_expected.to_not be_valid }
    end

    context "validation book" do
      let!(:line_item) {create :line_item}
      subject { build :line_item, line_item.attributes }
      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do
   it { is_expected.to belong_to(:book)}
   it { is_expected.to belong_to(:order)}
  end
end
