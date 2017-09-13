FactoryGirl.define do
  factory :order_address do
    first_name  {Faker::Name.first_name}
    last_name   {Faker::Name.last_name}
    zip_code    {Faker::Address.zip_code}
    street      {Faker::Address.street_address}
    city        {Faker::Address.city}
    order_id    {FactoryGirl.create(:order).id}
  end
end
