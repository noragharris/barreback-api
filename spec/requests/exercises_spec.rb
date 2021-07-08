require 'rails_helper'

RSpec.describe '/exercises', type: :request do
  # initialize test data
  let!(:exercises) { create_list(:exercise, 10) }
  let(:exercise_id) { exercises.first.id }

  let(:invalid_attributes) do
    { wrong: 'wrong' }
  end

  describe 'GET /exercises' do
    before { get '/exercises' }

    it 'returns exercises' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /exercises/:id' do
    before { get "/exercises/#{exercise_id}" }

    context 'when the record exists' do
      it 'returns the exercise' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(exercise_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:exercise_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Exercise/)
      end
    end
  end

  describe 'POST /exercises' do
    let(:valid_attributes) { attributes_for(:exercise) }

    context 'when the request is valid' do
      before { post '/exercises', params: valid_attributes, as: :json }

      it 'creates a exercise' do
        expect(json['name']).to eq(valid_attributes[:name])
        expect(json['year']).to eq(valid_attributes[:year])
        enum_validator(Exercise.quarters, valid_attributes[:quarter], json['quarter'])
        enum_validator(Exercise.class_types, valid_attributes[:class_type], json['class_type'])
        enum_validator(Exercise.rotations, valid_attributes[:rotation], json['rotation'])
        enum_validator(Exercise.sections, valid_attributes[:section], json['section'])
        enum_validator(Exercise.locations, valid_attributes[:location], json['location'])
        enum_validator(Exercise.directions, valid_attributes[:direction], json['direction'])
        enum_validator(Exercise.heights, valid_attributes[:height], json['height'])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/exercises', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to include('Validation failed')
      end
    end
  end
end
