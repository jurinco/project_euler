require_relative '../card'

describe Card do
  let(:ace_c)   { Card.new('AC') }
  let(:king_s)  { Card.new('KS') }
  let(:queen_s) { Card.new('QS') }
  let(:jack_d)  { Card.new('JD') }
  let(:ten_h)   { Card.new('10H') }
  let(:nine_s)  { Card.new('9S') }
  let(:four_c)  { Card.new('4C') }
  let(:two_d)   { Card.new('2D') }

  describe '#new' do
    it 'raises an error if card arg is not provided' do
      expect { Card.new }.to raise_error(ArgumentError)
    end

    it 'returns a Card object' do
      expect(ace_c).to be_instance_of(Card)
    end
  end

  describe '#rank' do
    it 'returns the correct rank' do
      expect(ace_c.rank).to   eql(14)
      expect(king_s.rank).to  eql(13)
      expect(queen_s.rank).to eql(12)
      expect(jack_d.rank).to  eql(11)
      expect(ten_h.rank).to   eql(10)
      expect(nine_s.rank).to  eql(9)
      expect(four_c.rank).to  eql(4)
      expect(two_d.rank).to   eql(2)
    end
  end

  describe '#suit' do
    it 'returns the correct suit' do
      expect(ace_c.suit).to   eql('C')
      expect(king_s.suit).to  eql('S')
      expect(queen_s.suit).to eql('S')
      expect(jack_d.suit).to  eql('D')
      expect(ten_h.suit).to   eql('H')
      expect(nine_s.suit).to  eql('S')
    end
  end

end
