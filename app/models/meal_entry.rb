class MealEntry < ApplicationRecord
  belongs_to :user
  belongs_to :meal_type

  validates_presence_of :name
end
