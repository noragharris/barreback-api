# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/equipment_items', type: :request do
  # initialize test data
  let!(:equipment_items) { create_list(:equipment_item, 10) }
  let(:equipment_item_id) { equipment_items.first.id }

  let(:invalid_attributes) do
    { wrong: 'wrong' }
  end

  describe 'GET /equipment_items' do
    before { get '/equipment_items' }

    it 'returns equipment items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /equipment_item/:id' do
    before { get "/equipment_items/#{equipment_item_id}" }

    context 'when the record exists' do
      it 'returns the equipment item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(equipment_item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:equipment_item_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find EquipmentItem")
      end
    end
  end

  describe 'POST /equipment_items' do
    let(:valid_attributes) { attributes_for(:equipment_item) }

    context 'when the request is valid' do
      before { post '/equipment_items', params: valid_attributes, as: :json }

      it 'creates a exercise' do
        expect(json['name']).to eq(valid_attributes[:name])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/equipment_items', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to include('Validation failed')
      end
    end
  end

  # TODO: PUT
  # TODO DELETE
end
