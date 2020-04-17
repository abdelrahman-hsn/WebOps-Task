# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visiting users', type: :request do
  it 'should load users' do
    get '/users'#, headers: { 'Authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODcxODA1Njh9.K8lg6eqOM-v2LO1XGPu6gi4tskIRVnnKdL-jKLNkHrE' }

    expect(response.code).to eq('200')
  end
  it 'create User' do
    post '/users', params: { "user": { "name": 'Abdo', "email": '11test@gmail.com', "password": 'HELLO123', "password_confirmation": 'HELLO123', "image": 'https://github.com/Abd-El-Rahman-HSN/trips/blob/master/trip.png' } }

    expect(response.code).to eq('201')
  end
end
