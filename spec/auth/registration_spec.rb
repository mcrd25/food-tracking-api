require "rails_helper"
RSpec.describe "Registration", :type => :request do
  before(:each) do
    @url = '/auth/'
    password = Faker::Internet.password
    @params = {
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password
    }
  end
  describe 'Email registration method' do
    describe 'POST /auth/' do
      context 'when signup params is valid' do
        before do
          post @url, params: @params
        end
        it 'returns status 200' do
          expect(response).to have_http_status(200)
        end
        it 'returns status success' do
          parsed_response = JSON.parse(response.body)
          expect(parsed_response['status']).to eq('success')
        end
        it 'returns accesss token in headers' do
          expect(response.headers['access-token']).to be_present
        end
        it 'creates new user' do
          password = Faker::Internet.password
          expect{
            post @url, params: { 
              email: Faker::Internet.email,
              name: Faker::Name.name,
              password: password,
              password_confirmation: password 
            } 
         }.to change(User, :count).by(1)
       end
     end
     context 'when signup params is invalid' do
        before { post @url }
        it 'returns unprocessable entity 422' do
          expect(response.status).to eq 422
        end
      end
    end
  end
end