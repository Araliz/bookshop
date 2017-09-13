FactoryGirl.define do
  factory :order do
    shipping_type_id  {FactoryGirl.create(:shipping_type).id}
    user
    comment           "Test comment"
  end
end
