FactoryGirl.define do
  factory :user do
    username "Test user"
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end
