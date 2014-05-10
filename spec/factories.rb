FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password(8)

    trait :logged_in do
      after(:create) { |u| login_as(u, scope: :user) }
    end
  end
end
