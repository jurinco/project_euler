require_relative 'summation_of_primes'

describe 'summation_of_primes' do
  it 'returns the correct value when limit=10' do
    expect(summation_of_primes(10)).to eql(17)
  end
end
