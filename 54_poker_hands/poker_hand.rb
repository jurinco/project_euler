require_relative 'card'

class PokerHand
  include Comparable

  attr_reader :cards

  def initialize(cards)
    raise ArgumentError, 'cards must be an array' unless cards.is_a? Array
    raise ArgumentError, 'cards must have length 5' unless cards.length == 5
    @cards = cards.map { |card| Card.new(card) }
  end

  def <=>(other_hand)
    rank <=> other_hand.rank
  end

  def card_ranks
    @card_ranks ||= cards.map { |card| card.rank }.sort { |a,b| b <=> a }
  end

  def rank
    if straight? && flush?
      return [8, card_ranks[0]]
    elsif four_of_a_kind?
      return [7, kind(4), kind(1)]
    elsif three_of_a_kind? && two_of_a_kind?
      return [6, kind(3), kind(2)]
    elsif flush?
      return [5, card_ranks].flatten
    elsif straight?
      return [4, 5] if ace_low_straight?
      return [4, card_ranks[0]]
    elsif three_of_a_kind?
      return [3, kind(3), card_ranks_excluding(kind 3)].flatten
    elsif two_pair
      return [2, two_pair, card_ranks_excluding(*two_pair)].flatten
    elsif two_of_a_kind?
      return [1, kind(2), card_ranks_excluding(kind 2)].flatten
    else
      return [0, card_ranks].flatten
    end
  end

  private

  def flush?
    cards.all? { |card| card.suit == cards[0].suit }
  end

  def straight?
    c = card_ranks.uniq
    c.count == 5 && c.max-c.min == 4 || ace_low_straight?
  end

  def ace_low_straight?
    card_ranks == [14,5,4,3,2]
  end

  def n_of_a_kind(n)
    card_ranks.find { |r|
      card_ranks.count { |s| s == r } == n
    }
  end
  alias_method :kind, :n_of_a_kind

  def four_of_a_kind?
    !!n_of_a_kind(4)
  end

  def three_of_a_kind?
    !!n_of_a_kind(3)
  end

  def two_of_a_kind?
    !!n_of_a_kind(2)
  end

  def two_pair
    r1 = n_of_a_kind(2)
    return nil unless r1
    ranks_remain = card_ranks_excluding(r1)
    r2 = ranks_remain.find { |r|
      card_ranks.count { |s| s == r } == 2
    }
    return nil unless r2
    [r1, r2].sort { |a,b| b <=> a }
  end

  def card_ranks_excluding(*excluded_vals)
    card_ranks.select { |r| !excluded_vals.include?(r) }
  end
end
