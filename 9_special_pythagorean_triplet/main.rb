require_relative 'pythagorean_triplets'

triplets = pythagorean_triplets(500)

triplets.each do |triplet|
  if triplet.reduce(:+) == 1000
    puts triplet.join(' ')
    puts "    sum: #{triplet.reduce(:+)}"
    puts "product: #{triplet.reduce(:*)}"
  end
end
