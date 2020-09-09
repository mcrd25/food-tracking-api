require 'rails_helper'

RSpec.describe MealType, type: :model do
  describe 'model relationships' do
    it { should have_many(:meal_entries) }
  end
  describe 'column presence' do
    it { should validate_presence_of(:name) }
  end
end
