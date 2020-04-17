# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login User', type: :request do
  it 'login' do
    headers = { 'ACCEPT' => 'application/json' }
    post '/auth/login', params: { "email": '11test@gmail.com', "password": 'HELLO123' }, headers: headers

    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response.code).to eq('200')

    puts JSON.parse(response.body)['token']
  end
end
