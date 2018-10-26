FactoryGirl.define do
  factory :transaction do
    user nil
    book_instance nil
    type ""
    status "MyString"
    date "MyString"
  end
end
