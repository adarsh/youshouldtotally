FactoryGirl.define do
  factory :television_show do
    sequence(:title) { |n| "Show #{n}" }
  end

  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password_digest "password"
  end
end
