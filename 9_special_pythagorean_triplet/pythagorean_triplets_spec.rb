require_relative 'pythagorean_triplets'

describe 'pythagorean_triplets' do
  before :all do
    @triplets = [[3,4,5], [6,8,10], [5,12,13], [9,12,15], [8, 15, 17]]
  end

  it 'should return the correct result for c_max = 5' do
    expect(pythagorean_triplets(5)).to eql([@triplets[0]])
  end

  it 'should return the correct result for c_max = 11' do
    expect(pythagorean_triplets(11)).to eql(@triplets[0..1])
  end

  it 'should return the correct result for c_max = 18' do
    expect(pythagorean_triplets(18)).to eql(@triplets)
  end
end
