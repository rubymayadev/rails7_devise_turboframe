require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'Profiles#create' do

    it 'return sucess' do
      expect(Profile.count).to eq(0)

      params = { profile: {first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      nick_name: Faker::Address.full_address,
      email_address: Faker::Internet.safe_email,
      phone_number: "123-456-9876"} }

      post :create, params: params
      byebug
      expect(Profile.count).to eq(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to "/employers/new"
    end

    it 'return faliure' do
     params = { profile: {first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      nick_name: Faker::Address.full_address,
      email_address: Faker::Internet.safe_email,
      phone_number: ""} }

      post :create, params: params

      expect(response).to have_http_status(422)
    end
  end

  describe 'Profiles#new' do

    it 'return sucess' do
      expect(Profile.count).to eq(0)

      params = { profile: {first_name: Faker::Name.name,
      last_name: Faker::Name.name,
      nick_name: Faker::Address.full_address,
      email_address: Faker::Internet.safe_email,
      phone_number: "123-456-9876"} }

      get :new, params: params
      
      expect(response).to have_http_status(:success)
    end
  end
end