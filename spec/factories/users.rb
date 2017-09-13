FactoryGirl.define do
  factory :user do
    username {Faker::Name.name}
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    admin false
  end
  factory :admin, class: User do
    username {Faker::Name.name}
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    admin true
  end
end
