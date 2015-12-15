# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { | n | "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :confirmed_user, parent: :user do
    after(:create) { |user| user.confirm }
  end
end

