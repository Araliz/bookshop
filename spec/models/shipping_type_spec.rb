require 'rails_helper'

RSpec.describe ShippingType, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:name)}
    it {is_expected.to have_db_column(:cost)}
  end

  describe "validations" do
    it {is_expected.to  validate_presence_of(:name)}
    it {is_expected.to  validate_numericality_of(:cost).is_greater_than_or_equal_to(0.0)}


    context "no validation shipping type" do
      it { is_expected.to_not be_valid }
    end

    context "validation shipping type" do
      let!(:shipping_type) {create :shipping_type}
      subject { build :shipping_type, shipping_type.attributes }
      it { is_expected.to be_valid }
    end
  end

end
