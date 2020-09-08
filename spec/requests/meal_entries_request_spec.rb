require 'rails_helper'

RSpec.describe 'MealEntries', type: :request do
  let!(:meal_type) { create(:meal_type) }
  let!(:user) { create(:user) }
  let!(:meal_entries) { create_list(:meal_entry, 5, meal_type_id: meal_type.id, user_id: user.id) }

  describe 'GET /meal_entries' do
    before { get '/meal_entries' }
    it 'returns todos' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end
end
