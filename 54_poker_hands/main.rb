require_relative 'poker_hand'

hand_pairs = []
File.open('poker.txt', 'r') do |f|
  f.each_line do |line|
    line.gsub!('T','10')
    hand_pairs << [line.split[0..4], line.split[5..9]]
  end
end

comparisons = hand_pairs.map { |hand_pair|
  PokerHand.new(hand_pair[0]) <=> PokerHand.new(hand_pair[1])
}

p comparisons.count { |w| w == 1 } # => 376
