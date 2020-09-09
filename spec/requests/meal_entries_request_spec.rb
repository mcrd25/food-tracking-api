require 'rails_helper'

RSpec.describe 'MealEntries', type: :request do
  let!(:meal_type) { create(:meal_type) }
  let!(:user) { create(:user) }
  let!(:meal_entries) { create_list(:meal_entry, 15, meal_type_id: meal_type.id, user_id: user.id) }
  let(:entry_id) { meal_entries.first.id }
  let!(:headers) { valid_headers }

  describe 'GET /meal_entries' do
    before { get '/meal_entries', params: {}, headers: headers }
    it 'returns meal entries' do
      expect(json).not_to be_empty
      expect(json.size).to eq(15)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /meal_entries/:id' do
    before { get "/meal_entries/#{entry_id}", params: {}, headers: headers }

    context 'when meal entry exists' do
      it 'returns specified meal entry' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(entry_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when meal entry does not exist' do
      let(:entry_id) { 1000 }

      it 'does not return a meal entry' do
        expect(json).to be_nil
      end
    end
  end

  describe 'POST /meal_entries' do
    let(:valid_attr) do
      {
        name: 'Choco Pancakes',
        description: 'gluten free pancakes',
        calories: 900,
        meal_type_id: meal_type.id
      }.to_json
    end

    context 'when request is valid' do
      before { post '/meal_entries', params: valid_attr, headers: headers }

      it 'creates a meal entry' do
        expect(json['name']).to eq('Choco Pancakes')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      let(:invalid_attr) { { name: 'Something yummuy' }.to_json }
      before { post '/meal_entries', params: invalid_attr, headers: headers }

      it 'returns status code of 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message']).to match(/Validation failed: Meal type must exist/)
      end
    end
  end

  describe 'PUT /meal_entries/:id' do
    let(:valid_attr) { { name: 'New name' }.to_json }

    context 'when the meal entry exists' do
      before { put "/meal_entries/#{entry_id}", params: valid_attr, headers: headers }

      it 'updates the entry' do
        expect(response.body).to_not be_empty
      end

      it 'returns status code of 204' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when meal entry does not exist' do
      before { put "/meal_entries/#{entry_id}", params: valid_attr, headers: headers }
      let(:entry_id) { 1000 }

      it 'returns status code of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
