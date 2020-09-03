FactoryBot.define do
  factory :meal_entry do
    user { nil }
    meal_type { nil }
    name { 'MyString' }
    description { 'MyString' }
    calories { '' }
  end
end
