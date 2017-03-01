require 'rails_helper'

describe "Hot Reads" do 
  context 'when request is made to api/v1/reads' do
    it 'posts to the database' do

      expect(Read.count).to be(0)

      json = ({read: true, url: 'http://turing.io'}).to_json

      post 'http://localhost:2999/reads', { :link=> json }

      expect(response.status).to eq(204)
      expect(Read.count).to eq(1)
      expect(Read.first).to respond_to(:url)
      expect(Read.first).to respond_to(:count)
      expect(Read.first.url).to eq('http://turing.io')
      expect(Read.first.count).to eq(1)

    end
  end
end
