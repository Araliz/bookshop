FactoryGirl.define do
  factory :review do
    user_id {FactoryGirl.create(:user).id}
    book
    title "Test"
    content "Test comment"
    rating 4
  end
end
