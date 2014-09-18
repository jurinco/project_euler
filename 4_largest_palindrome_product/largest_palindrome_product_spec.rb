require_relative 'largest_palindrome_product'

describe 'largest_palindrome_product' do
  it 'should return the correct result for 1 digit values' do
    expect(largest_palindrome_product(1)).to eql([9, 1, 9])
  end

  it 'should return the correct result for 2 digit values' do
    expect(largest_palindrome_product(2)).to eql([99, 91, 9009])
  end
end
