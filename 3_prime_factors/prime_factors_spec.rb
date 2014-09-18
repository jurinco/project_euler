require_relative 'prime_factors'

describe 'prime_factors' do
  it 'returns the correct values' do
    expect(prime_factors(13195)).to eql([5, 7, 13, 29])
  end
end
