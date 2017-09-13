FactoryGirl.define do
  factory :category do
    name {Faker::Book.genre.capitalize}
  end
end
