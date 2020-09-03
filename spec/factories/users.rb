FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    lastt_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
  end
end
