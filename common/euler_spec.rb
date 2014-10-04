require_relative 'euler'
include Euler

describe Integer do
  describe '#abundant_number?' do
    it 'returns the correct result' do
      expect(10.abundant_number?).to eql(false)
      expect(11.abundant_number?).to eql(false)
      expect(12.abundant_number?).to eql(true)
    end
  end

  describe '#factorial' do
    it 'returns the correct result' do
      expect(0.factorial).to eql(1)
      expect(1.factorial).to eql(1)
      expect(5.factorial).to eql(120)
      expect(13.factorial).to eql(6_227_020_800)
    end
  end

  describe '#factors' do
    it 'returns the correct result' do
      expect(1.factors).to eql([1])
      expect(3.factors).to eql([1,3])
      expect(6.factors).to eql([1,2,3,6])
      expect(10.factors).to eql([1,2,5,10])
      expect(15.factors).to eql([1,3,5,15])
      expect(21.factors).to eql([1,3,7,21])
      expect(28.factors).to eql([1,2,4,7,14,28])
    end
  end

  describe '#proper_divisors' do
    it 'returns the correct result' do
      expect(220.proper_divisors).to eql([1,2,4,5,10,11,20,22,44,55,110])
      expect(284.proper_divisors).to eql([1,2,4,71,142])
    end
  end
end

describe Euler do
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
end
