require 'rails_helper'

RSpec.describe 'MealTypes', type: :request do
  let!(:user) { create(:user) }
  let!(:meal_types) { create_list(:meal_type, 5) }
  let(:type_id) { meal_types.first.id }
  let!(:headers) { valid_headers }

  describe 'GET /meal_types' do
    before { get '/meal_types', params: {}, headers: headers }
    it 'returns meal types' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /meal_types/:id' do
    before { get "/meal_types/#{type_id}", params: {}, headers: headers }

    context 'when meal type exists' do
      it 'returns specified meal type' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(type_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when meal type does not exist' do
      let(:type_id) { 100 }

      it 'does not return a meal type' do
        expect(json).to be_nil
      end
    end
  end
end
