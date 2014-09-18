require_relative 'smallest_multiple'

describe 'smallest_multiple' do
  it 'returns the correct value' do
    # values = (1..10).to_a
    values = [6, 7, 8, 9 ,10]
    expect(smallest_multiple(values)).to eql(2520)
  end
end
