require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) do
    User.create(
      email: 'sarah@test.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  # -----index-----
  describe "GET /index" do
    it 'gets all the apartments' do
      Apartment.create street: '221c Baker Street', city: 'London', state: 'England', manager: 'Ms. Hudson', email: 'mzhud@email.com', price: '1000', bedrooms: 2, bathrooms: 2, pets: 'no', user_id: user.id

      get '/apartments'
      apartments = JSON.parse(response.body)

      expect(apartments.length).to eq 1
      expect(response).to have_http_status(200)
      apartment = apartments.first

      expect(apartment['street']).to eq '221c Baker Street'
      expect(apartment['city']).to eq 'London'
      expect(apartment['state']).to eq 'England'
      expect(apartment['manager']).to eq 'Ms. Hudson'
      expect(apartment['email']).to eq 'mzhud@email.com'
    end
  end

    # -----create-----
  describe "POST /cats" do
    it 'creates a new apartment' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params

      apartment_response = JSON.parse(response.body)
      expect(apartment_response['street']).to eq '221B Baker Street'
      expect(apartment_response['city']).to eq 'London'
      expect(apartment_response['state']).to eq 'England'
    end

    it 'cannot create a new apartment without a street' do
      apartment_params = {
        apartment: {
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['street']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without a city' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['city']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without a state' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      apartment = JSON.parse(response.body)
      error_response = JSON.parse(response.body)
      expect(error_response['state']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without a manager' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['manager']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without an email' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['email']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without a price' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['price']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without bedrooms' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['bedrooms']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without bathrooms' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['bathrooms']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new apartment without pets' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response['pets']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end

    # -----update-----
  describe 'PUT /cats' do
    it 'edits an apartment' do
      apartment = Apartment.create(
        street: '221B Baker Street',
        city: 'London',
        state: 'England',
        manager: 'Ms. Hudson',
        email: 'mzhud@email.com',
        price: '1000',
        bedrooms: 2,
        bathrooms: 2,
        pets: 'no',
        user_id: user.id
        )

      update_apartment_params = {
        apartment: {
          street: '221Z Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      patch "/apartments/#{apartment.id}", params: update_apartment_params

      updated_cat_response = JSON.parse(response.body)
      expect(updated_cat_response['street']).to eq '221Z Baker Street'
      expect(updated_cat_response['price']).to eq '1500'
      expect(updated_cat_response['pets']).to eq 'yes'
      expect(response).to have_http_status(200)
    end
  end

    # -----delete-----
  describe 'DELETE /cats' do
    it 'deletes an apartment' do
      apartment_params = {
        apartment: {
          street: '221B Baker Street',
          city: 'London',
          state: 'England',
          manager: 'Ms. Hudson',
          email: 'mzhud@email.com',
          price: '1500',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      apartment = Apartment.first
      delete "/apartments/#{apartment.id}"
      apartments = Apartment.all

      expect(apartments).to be_empty
      expect(response).to have_http_status(200)
    end
  end
end
