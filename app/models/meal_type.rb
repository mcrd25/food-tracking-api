class MealType < ApplicationRecord
  has_many :meal_entries

  validates_presence_of :name
end
