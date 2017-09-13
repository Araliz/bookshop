FactoryGirl.define do
  factory :line_item do
    book_id {FactoryGirl.create(:book).id}
    unit_price {FactoryGirl.create(:book).price}
    item_name {FactoryGirl.create(:book).title}
    order
    quantity 1
  end
end
