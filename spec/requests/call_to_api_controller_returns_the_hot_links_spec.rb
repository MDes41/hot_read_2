require 'rails_helper'


describe 'Hot Reads' do
  context 'When request is made to api/v1/reads' do
    it 'returns all items' do

      expect(Read.count).to be(0)

      Read.create(url: "http://turing.io", count: 4)
      Read.create(url: "http://www.reddit.com", count: 3)
      Read.create(url: "http://www.wsj.com", count: 1)
      Read.create(url: "http://www.yahoo.com", count: 2)

      get 'http://localhost:2999/api/v1/reads'

      json = JSON.parse(response.body, symbolize_names: true)


      expect(response.status).to eq(200)
      expect(json).to be_kind_of(Array)
      expect(json.first).to have_key(:url)
      expect(json.first).to have_key(:count)
      expect(json.first[:url]).to eq('http://turing.io')
      expect(json.first[:count]).to eq(4)
    end
  end
end