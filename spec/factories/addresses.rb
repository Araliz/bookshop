FactoryGirl.define do
  factory :address do
    first_name  {Faker::Name.first_name}
    last_name   {Faker::Name.last_name}
    zip_code    {Faker::Address.zip_code}
    street      {Faker::Address.street_address}
    city        {Faker::Address.city}
    user
  end
end
