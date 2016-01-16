FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password_digest "password"
  end
end
