require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "database columns" do
    it {is_expected.to have_db_column(:shipping_type_id)}
    it {is_expected.to have_db_column(:user_id)}
    it {is_expected.to have_db_column(:comment)}
  end

  describe 'associations' do
   it { is_expected.to have_many(:line_items).dependent(:destroy) }
   it { is_expected.to have_many(:books).through(:line_items) }
   it { is_expected.to have_many(:transitions).class_name('OrderTransition') }
   it { is_expected.to have_one(:order_address).dependent(:destroy) }
   it { is_expected.to belong_to(:shipping_type)}
   it { is_expected.to belong_to(:user)}
  end
  describe 'nested attributes' do
  it { should accept_nested_attributes_for :order_address }
end
end
