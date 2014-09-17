require_relative 'multiples'

describe 'multiples: sum multiples of 3 or 5' do
  it 'returns the correct result' do
    expect(multiples(10)).to eql(23)
    expect(multiples(15)).to eql(45)
  end
end
