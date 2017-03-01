require 'rails_helper'

RSpec.describe Read, type: :model do
  it 'adds to the read count when true' do 
    read =  Read.create(url: 'http://turing.io', count: 0 )

    parsed_json = {"read"=>true }

    HandleRead.add_or_subtract(parsed_json, read)

    expect(read.count).to eq(1)
  end

  it 'subtracts from the read count when false' do
    read =  Read.create(url: 'http://turing.io', count: 1 )

    parsed_json = {"read"=>false }

    HandleRead.add_or_subtract(parsed_json, read)

    expect(read.count).to eq(0)
  end
end
