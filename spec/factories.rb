FactoryGirl.define do
  factory :recommended_item do
    television_show
    user
  end

  factory :television_show do
    sequence(:title) { |n| "Show #{n}" }
  end

  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:username) { |n| "username#{n}" }
    password_digest "password"
  end
end
