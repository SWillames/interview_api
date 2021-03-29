FactoryBot.define do
  factory :user do
    uid          { Faker::Lorem.word }
    email        { Faker::Internet.email }
    name         { Faker::Name.name }
    nickname     { Faker::Internet.user_name }
    password     { Faker::Internet.password }
    provider     { "email" }
  end
end
