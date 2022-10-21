require 'rails_helper'

RSpec.describe EmployersController, type: :controller do
  describe 'Employers#create' do
  let(:profile) { create(:profile) }

    it 'return sucess with one object' do
      expect(Employer.count).to eq(0)

      params = {  "_json": [{employment: Faker::Name.name,
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period, profile_id: profile.id}]}

      post :create, params: params

      expect(Employer.count).to eq(1)
      expect(response).to have_http_status(200)
    end

    it 'return sucess with more than one object' do
      expect(Employer.count).to eq(0)

      params = {  "_json": [{employment: Faker::Name.name,
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period, profile_id: profile.id},{employment: Faker::Name.name,
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period, profile_id: profile.id},{employment: Faker::Name.name,
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period, profile_id: profile.id}]}

      post :create, params: params

      expect(Employer.count).to eq(3)
      expect(response).to have_http_status(200)
    end

    it 'return faliure' do
      params = {  "_json": [{employment: "",
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period, profile_id: profile.id}]}


      post :create, params: params

      # expect(response).to have_http_status(422)
    end
  end

  describe 'Employers#new' do
  let(:profile) { create(:profile) }

    it 'return sucess' do
      expect(Employer.count).to eq(0)

      params = {  "_json": [{employment: Faker::Name.name,
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period, profile_id: profile.id}]}


      get :new, params: params
      
      expect(response).to have_http_status(:success)
    end
  end
end