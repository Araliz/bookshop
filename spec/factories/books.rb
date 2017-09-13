FactoryGirl.define do
  factory :book do
    title {Faker::Book.title.capitalize}
    author {Faker::Book.author}
    description{ Faker::Lorem.paragraphs(3).join("\n\n")}
    category
    price {Faker::Number.decimal(2,2)}
    publisher {Faker::Book.publisher}
    publication_date 2017
    language "English"
  end
end
