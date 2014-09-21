require_relative 'collatz'

describe 'collatz_length' do
  it 'returns the correct result for n=13' do
    expect(collatz_length(13)).to eql(10)
  end
end
