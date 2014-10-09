require_relative '../poker_hand'

describe PokerHand do
  let(:royal_flush) { PokerHand.new( %w(KC QC JC 10C 9C) ) }
  let(:strt_flush) { PokerHand.new( %w(10H 9H 8H 7H 6H) ) }
  let(:four_kind)  { PokerHand.new( %w(5D 5H 10D 5S 5C) ) }
  let(:full_house) { PokerHand.new( %w(6D 9D 6H 6C 9H) ) }
  let(:flush)      { PokerHand.new( %w(7S KS AS 9S 4S) ) }
  let(:straight)   { PokerHand.new( %w(5S 7D 8C 9D 6H) ) }
  let(:three_kind) { PokerHand.new( %w(3D 3H 9D 3C KH) ) }
  let(:two_pair)   { PokerHand.new( %w(3D 3S 6D 9H 6S) ) }
  let(:one_pair)   { PokerHand.new( %w(8C 5H KC JS 5S) ) }
  let(:king_high)  { PokerHand.new( %w(QC 5H 7D 9C 4D) ) }
  let(:nine_high)  { PokerHand.new( %w(2D 5H 3D 7D 9C) ) }

  let(:ace_low_str)  { PokerHand.new( %w(4S AS 3D 2C 5C) ) }
  let(:ace_high_str) { PokerHand.new( %w(JC 10C AD KS QS) ) }

  describe '#new' do
    it 'raises an error if cards is not an array' do
      expect { PokerHand.new }.to raise_error(ArgumentError)
    end

    it 'raises an error if cards != 5' do
      expect { PokerHand.new([1,2,3,4]) }.to raise_error(ArgumentError)
      expect { PokerHand.new([1,2,3,4,5,6]) }.to raise_error(ArgumentError)
    end

    it 'returns a PokerHand object' do
      expect(king_high).to be_instance_of(PokerHand)
    end
  end

  describe '#<=>' do
    it 'returns the correct result' do
      expect(royal_flush <=> king_high).to eql 1
      expect(royal_flush <=> ace_low_str).to eql 1
      expect(king_high <=> nine_high).to eql(1)
      expect(king_high <=> king_high).to eql(0)
      expect(nine_high <=> king_high).to eql(-1)
      expect(ace_high_str <=> ace_low_str).to eql(1)
      expect(strt_flush <=> four_kind).to eql 1
      expect(two_pair <=> two_pair).to eql 0
      expect(two_pair <=> one_pair).to eql 1
      expect(one_pair <=> three_kind).to eql -1
    end
  end

  describe '#card_ranks' do
    it 'returns an array of the correct ranks' do
      expect(strt_flush.card_ranks).to eql [10,9,8,7,6]
      expect(four_kind.card_ranks).to  eql [10,5,5,5,5]
      expect(full_house.card_ranks).to eql [9,9,6,6,6]
      expect(flush.card_ranks).to      eql [14,13,9,7,4]
      expect(straight.card_ranks).to   eql [9,8,7,6,5]
      expect(three_kind.card_ranks).to eql [13,9,3,3,3]
      expect(two_pair.card_ranks).to   eql [9,6,6,3,3]
      expect(one_pair.card_ranks).to   eql [13,11,8,5,5]
      expect(king_high.card_ranks).to  eql [12,9,7,5,4]
      expect(nine_high.card_ranks).to  eql [9,7,5,3,2]
    end
  end

  describe '#rank' do
    it 'returns the correct ranks' do
      expect(strt_flush.rank).to eql [8,10]
      expect(four_kind.rank).to  eql [7,5,10]
      expect(full_house.rank).to eql [6,6,9]
      expect(flush.rank).to      eql [5,14,13,9,7,4]
      expect(straight.rank).to   eql [4,9]
      expect(three_kind.rank).to eql [3,3,13,9]
      expect(two_pair.rank).to   eql [2,6,3,9]
      expect(one_pair.rank).to   eql [1,5,13,11,8]
      expect(king_high.rank).to  eql [0,12,9,7,5,4]
      expect(nine_high.rank).to  eql [0,9,7,5,3,2]
    end
  end

  describe '#straight?' do
    it 'returns true when there is a straight' do
      expect(straight.straight?).to     eql(true)
      expect(strt_flush.straight?).to   eql(true)
      expect(ace_low_str.straight?).to  eql(true)
      expect(ace_high_str.straight?).to eql(true)
    end

    it 'returns false when there is not a straight' do
      expect(four_kind.straight?).to  eql(false)
      expect(full_house.straight?).to eql(false)
      expect(flush.straight?).to      eql(false)
      expect(three_kind.straight?).to eql(false)
      expect(two_pair.straight?).to   eql(false)
      expect(one_pair.straight?).to   eql(false)
      expect(king_high.straight?).to  eql(false)
    end
  end

  describe '#flush?' do
    it 'returns true when there is a flush' do
      expect(flush.flush?).to      eql(true)
      expect(strt_flush.flush?).to eql(true)
    end

    it 'returns false when there is not a flush' do
      expect(straight.flush?).to     eql(false)
      expect(ace_low_str.flush?).to  eql(false)
      expect(ace_high_str.flush?).to eql(false)
      expect(four_kind.flush?).to    eql(false)
      expect(full_house.flush?).to   eql(false)
      expect(three_kind.flush?).to   eql(false)
      expect(two_pair.flush?).to     eql(false)
      expect(one_pair.flush?).to     eql(false)
      expect(king_high.flush?).to    eql(false)
    end
  end

  describe '#two_pair' do
    it 'returns two pair when they exist' do
      expect(two_pair.two_pair).to eql([6,3])
    end
  end
end
