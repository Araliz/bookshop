User.create! username: "Admin", email: "admin@admin.com", password: "adminadmin", password_confirmation: "adminadmin", admin: true
User.create! username: "Foobar", email: "foo@bar.com", password: "foobar", password_confirmation: "foobar"

ShippingType.create! name: "Postal Service", cost: 4.99
ShippingType.create! name: "Express Delivery", cost: 8.99 	
8.times do
  Category.create! name: Faker::Book.genre.capitalize
end

category_ids = Category.pluck(:id)
pub_date = (2000..2017).to_a
200.times do
  book = Book.create! title: Faker::Book.title.capitalize,
    author: Faker::Book.author,
    description: Faker::Lorem.paragraphs(3).join("\n\n"),
    category_id: category_ids.sample,
    price: Faker::Number.decimal(2,2),
    publisher: Faker::Book.publisher,
    publication_date: pub_date.sample,
    language: "English"
  book.save
end
