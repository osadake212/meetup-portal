FactoryGirl.define do
  factory :user do
    name "Smaple User"
    email "sample@example.com"
    password "hogehoge"
    password_confirmation "hogehoge"
  end
end
