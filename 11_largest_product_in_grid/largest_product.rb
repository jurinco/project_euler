grid = []
File.open('grid_data', 'r') do |f|
  f.each_line do |line|
    grid << line.split(' ').map { |el| el.to_i }
  end
end

max = 0

# left/right
grid.each do |row|
  (0..16).each do |i|
    product = row[i...i+4].reduce(:*)
    if product > max
      # puts "left, new max| #{row[i...i+4]} => #{product}"
      max = product
    end
  end
end

# up/down
(0..16).each do |i|
  (0..19).each do |j|
    product = 1
    (0..3).each do |k|
      product *= grid[i+k][j]
    end
    if product > max
      # puts "#{row[i...i+4].join(' ')} => #{product}"
      max = product
    end
  end
end

# diagonal, down and to the right
(0..16).each do |i|
  (0..16).each do |j|
    product = 1
    (0..3).each do |k|
      product *= grid[i+k][j+k]
      max = product if product > max
    end
  end
end

# diagonal, down and to the left
(0..16).each do |i|
  (3..19).each do |j|
    product = 1
    (0..3).each do |k|
      product *= grid[i+k][j-k]
      max = product if product > max
    end
  end
end

puts max

