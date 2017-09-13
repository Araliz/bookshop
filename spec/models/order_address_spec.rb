require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:first_name)}
    it {is_expected.to have_db_column(:last_name)}
    it {is_expected.to have_db_column(:city)}
    it {is_expected.to have_db_column(:street)}
    it {is_expected.to have_db_column(:zip_code)}
    it {is_expected.to have_db_column(:order_id)}
  end

  describe "validations" do
    it {is_expected.to  validate_presence_of(:first_name)}
    it {is_expected.to  validate_presence_of(:last_name)}
    it {is_expected.to  validate_presence_of(:city)}
    it {is_expected.to  validate_presence_of(:street)}
    it {is_expected.to  validate_presence_of(:zip_code)}
    it {is_expected.to  validate_presence_of(:order_id)}

    context "no validation order address" do
      it { is_expected.to_not be_valid }
    end

    context "validation order address" do
      let!(:order_address) {create :order_address}
      subject { build :order_address, order_address.attributes }
      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do
   it { is_expected.to belong_to(:order)}
 end
end
