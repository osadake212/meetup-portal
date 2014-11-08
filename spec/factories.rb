FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "hogehoge"
    password_confirmation "hogehoge"
  end

  factory :meetup do
    user
    sequence(:title) { |n| "Title #{n}" }
    short_description "short description"
    description %|### description|
    start_date DateTime.now + 1.hour
    end_date DateTime.now + 2.hour
  end

  factory :micropost do
    user
    sequence(:content) { |n| "Micropost #{n}" }
  end
end
