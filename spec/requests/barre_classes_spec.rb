require 'rails_helper'

RSpec.describe 'BarreClasses', type: :request do
  # initialize test data
  let!(:barre_classes) { create_list(:barre_class, 10) }
  let(:barre_class_id) { barre_classes.first.id }

  let(:invalid_attributes) do
    { wrong: 'wrong' }
  end

  describe 'GET /barre_classes' do
    before { get '/barre_classes' }

    it 'returns barre classes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /barre_class/:id' do
    before { get "/barre_classes/#{barre_class_id}" }

    context 'when the record exists' do
      it 'returns the equipment item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(barre_class_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:barre_class_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find BarreClass")
      end
    end
  end

  describe 'POST /barre_classes' do
    let(:valid_attributes) { attributes_for(:barre_class) }

    context 'when the request is valid' do
      before { post '/barre_classes', params: valid_attributes, as: :json }

      it 'creates a exercise' do
        expect(json['location']).to eq(valid_attributes[:location])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/barre_classes', params: invalid_attributes }

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
