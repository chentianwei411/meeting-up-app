require 'rails_helper'

RSpec.describe "ApiV1::Sessions", type: :request do
  let!(:user){ User.create!(email: 'test@test', password:'123123', name:'test')}

  describe 'login' do
    it "should login successfully" do
      post '/api/v1/sessions.json', params: {:user => {email:user.email, password: '123123' }}
      expect(response).to have_http_status(200)

      data = {
        'session' => {
          'id': user.id,
          'name': user.email,
          'token': user.authentication_token
        }
      }

      expect(response.body).to eq(data.to_json)
    end

    it "should login failed if wrong password" do
      post '/api/v1/sessions.json', params: {:user => {email: user.email, password: '123111'}}
      expect(response).to have_http_status(401)
    end
  end
end
