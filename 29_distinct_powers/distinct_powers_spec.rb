require_relative 'distinct_powers'

describe 'distinct_powers' do
  it 'returns the correct value' do
    expect(distinct_powers(2,5)).to eql([4,8,9,16,25,27,32,64,81,125,243,256,625,1024,3125])
  end
end
