require 'rails_helper'

RSpec.describe MealEntry, type: :model do
  describe 'model relationships' do
    it { should belong_to(:meal_type) }
    it { should belong_to(:user) }
  end
  describe 'column presence' do
    it { should validate_presence_of(:name) }
  end
end
