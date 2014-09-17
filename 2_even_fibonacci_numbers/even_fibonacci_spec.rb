require_relative 'even_fibonacci'

describe 'even_fibonacci' do
  it 'returns the correct results' do
    expect(even_fibonacci(10)).to eql(10)
    expect(even_fibonacci(20)).to eql(10)
    expect(even_fibonacci(100)).to eql(44)
  end
end
