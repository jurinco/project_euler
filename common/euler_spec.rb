require_relative 'euler'
include Euler

describe Integer do
  describe '#abundant?' do
    it 'returns false if number has no proper_divisors (e.g. 0, 1)' do
      expect(0.abundant?).to eql(false)
      expect(1.abundant?).to eql(false)
    end

    it 'returns the correct result for values with proper_divisors' do
      expect(10.abundant?).to eql(false)
      expect(11.abundant?).to eql(false)
      expect(12.abundant?).to eql(true)
    end
  end

  describe '#digital_sum' do
    it 'returns the correct result' do
      expect(123.digital_sum).to eql(6)
      expect(888.digital_sum).to eql(24)
      expect(8459.digital_sum).to eql(26)
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

  describe '#prime?' do
    context 'when number is negative' do
      it 'returns false' do
        expect(-1.prime?).to eql(false)
        expect(-2.prime?).to eql(false)
        expect(-3.prime?).to eql(false)
        expect(-4.prime?).to eql(false)
      end
    end

    it 'returns false for values that are not prime' do
      expect(0.prime?).to eql(false)
      expect(1.prime?).to eql(false)
      expect(4.prime?).to eql(false)
      expect(21.prime?).to eql(false)
      expect(57.prime?).to eql(false)
    end

    it 'returns true for values that are prime' do
      expect(2.prime?).to eql(true)
      expect(3.prime?).to eql(true)
      expect(5.prime?).to eql(true)
      expect(23.prime?).to eql(true)
      expect(31.prime?).to eql(true)
      expect(104729.prime?).to eql(true)
    end
  end

  describe '#polyagonal?' do
    it 'returns the correct results' do
      expect([1,8,21,40,65].all? { |n| n.polygonal? 8 }).to eql true
      expect((41..64).all? { |n| n.polygonal?(8) == false }).to eql true
    end
  end

  describe '#octagonal?' do
    it 'returns the correct results' do
      expect([1,8,21,40,65].all? { |n| n.octagonal? }).to eql(true)
      expect([11,12,13,14,16].all? { |n| n.octagonal? }).to eql(false)
    end
  end

  describe '#triangular?' do
    it 'returns the correct results' do
      expect([1,3,6,10,15].all? { |n| n.triangular? }).to eql(true)
      expect([11,12,13,14,16].all? { |n| n.triangular? }).to eql(false)
    end
  end

  describe '#square?' do
    it 'returns the correct results' do
      expect([1,4,9,16,25].all? { |n| n.square? }).to eql(true)
      expect([7,8,10,11,46].all? { |n| n.square? }).to eql(false)
    end
  end
  describe '#pentagonal?' do
    it 'returns the correct results' do
      expect([1,5,12,22,35].all? { |n| n.pentagonal? }).to eql(true)
      expect([23,24,25,26,36].all? { |n| n.pentagonal? }).to eql(false)
    end
  end

  describe '#hexagonal?' do
    it 'returns the correct results' do
      expect([1,6,15,28,45].all? { |n| n.hexagonal? }).to eql(true)
      expect([7,8,9,10,46].all? { |n| n.hexagonal? }).to eql(false)
    end
  end

  describe '#heptagonal?' do
    it 'returns the correct results' do
      expect([1,7,18,34,55].all? { |n| n.heptagonal? }).to eql(true)
      expect([19,20,21,22,33].all? { |n| n.heptagonal? }).to eql(false)
    end
  end
end

describe Euler do
  describe 'binomial' do
    it 'returns 0 if n < k' do
      expect(binomial(5,6)).to eql(0)
      expect(binomial(2,7)).to eql(0)
    end

    it 'returns 1 if n == k' do
      expect(binomial(12,12)).to eql(1)
      expect(binomial(23_456,23_456)).to eql(1)
    end

    it 'returns 1 if k <= 0' do
      expect(binomial(23_456,0)).to eql(1)
      expect(binomial(12,-1)).to eql(1)
    end

    it 'returns the correct results' do
      expect(binomial(14,2)).to eql(91)
      expect(binomial(14,12)).to eql(91)
      expect(binomial(30,18)).to eql(86_493_225)
    end
  end

  describe '#fibonacci_numbers' do
    it 'should return an Enumerator' do
      expect(fibonacci_nums).to be_an(Enumerator)
    end

    it 'should return the correct values' do
      expect(fibonacci_nums.first(10)).to eql([1,1,2,3,5,8,13,21,34,55])
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

  describe 'triangular_num' do
    it 'raises ArgumentError if i<0' do
      expect{triangular_num(-1)}.to raise_error(ArgumentError)
      expect{triangular_num(-5)}.to raise_error(ArgumentError)
    end

    it 'returns the correct results' do
      expect((0..5).map { |i| triangular_num(i) }).to eql([0,1,3,6,10,15])
    end
  end

  describe 'pentagonal_num' do
    it 'raises ArgumentError if i<0' do
      expect{pentagonal_num(-1)}.to raise_error(ArgumentError)
      expect{pentagonal_num(-5)}.to raise_error(ArgumentError)
    end

    it 'returns the correct results' do
      expect((0..5).map { |i| pentagonal_num(i) }).to eql([0,1,5,12,22,35])
    end
  end

  describe 'hexagonal_num' do
    it 'raises ArgumentError if i<0' do
      expect{hexagonal_num(-1)}.to raise_error(ArgumentError)
      expect{hexagonal_num(-5)}.to raise_error(ArgumentError)
    end

    it 'returns the correct results' do
      expect((0..5).map { |i| hexagonal_num(i) }).to eql([0,1,6,15,28,45])
    end
  end
end
