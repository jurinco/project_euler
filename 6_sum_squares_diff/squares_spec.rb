require_relative 'squares'

describe 'sum_of_squares' do
  it 'returns the correct result for 1..10' do
    vals = (1..10).to_a
    expect(sum_of_squares(vals)).to eql(385)
  end
end

describe 'square_of_sum' do
  it 'returns the correct result for 1..10' do
    vals = (1..10).to_a
    expect(square_of_sum(vals)).to eql(3025)
  end
end

describe 'sum_square_diff' do
  it 'returns the correct result for 1..10' do
    vals = (1..10).to_a
    expect(sum_square_diff(vals)).to eql(2640)
  end
end
