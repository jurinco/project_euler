require_relative 'euler'

include Euler

describe 'abundant_number?' do
  it 'returns the correct result' do
    expect(abundant_number?(10)).to eql(false)
    expect(abundant_number?(11)).to eql(false)
    expect(abundant_number?(12)).to eql(true)
  end
end

describe 'factors' do
  it 'returns the correct result' do
    expect(factors(1)).to eql([1])
    expect(factors(3)).to eql([1,3])
    expect(factors(6)).to eql([1,2,3,6])
    expect(factors(10)).to eql([1,2,5,10])
    expect(factors(15)).to eql([1,3,5,15])
    expect(factors(21)).to eql([1,3,7,21])
    expect(factors(28)).to eql([1,2,4,7,14,28])
  end
end

describe 'number_with_underscore_delimiter' do
  it 'returns the correct results' do
    expect(number_with_underscore_delimiter(1_000)).to eql('1_000')
    expect(number_with_underscore_delimiter(1_234)).to eql('1_234')
    expect(number_with_underscore_delimiter(34_567)).to    eql    '34_567'
    expect(number_with_underscore_delimiter(234_567)).to   eql   '234_567'
    expect(number_with_underscore_delimiter(1_234_567)).to eql '1_234_567'
  end
end

describe 'perfect_number?' do
  it 'returns the correct result' do
    expect(perfect_number?(26)).to eql(false)
    expect(perfect_number?(27)).to eql(false)
    expect(perfect_number?(28)).to eql(true)
  end
end


describe 'triangular_num' do
  it 'returns the correct results' do
    expect((1..5).map { |n| triangular_num(n) }).to eql([1, 3, 6, 10, 15])
  end
end

describe 'triangular_num?' do
  it 'returns the correct results' do
    expect([1, 3, 6, 10, 15].all? { |n| triangular_num?(n) }).to eql(true)
  end
end


describe 'pentagonal_num' do
  it 'returns the correct results' do
    expect((1..5).map { |n| pentagonal_num(n) }).to eql([1, 5, 12, 22, 35])
  end
end

describe 'pentagonal_num?' do
  it 'returns the correct results' do
    expect([1, 5, 12, 22, 35].all? { |n| pentagonal_num?(n) }).to eql(true)
  end
end


describe 'hexagonal_num' do
  it 'returns the correct results' do
    expect((1..5).map { |n| hexagonal_num(n) }).to eql([1, 6, 15, 28, 45])
  end
end

describe 'hexagonal_num?' do
  it 'returns the correct results' do
    expect([1, 6, 15, 28, 45].all? { |n| hexagonal_num?(n) }).to eql(true)
  end
end
