class Card
  attr_reader :suit, :rank

  # card ex: 'KH','QS','JD','10C','9D'...
  def initialize(card)
    @suit = card[-1]
    @rank = compute_rank(card[0..-2])
  end

  private

  def compute_rank(value_str)
    face_card_values = { J:11, Q:12, K:13, A:14 }
    face_card_values[value_str.to_sym] || value_str.to_i
  end
end
