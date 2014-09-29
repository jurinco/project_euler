words = File.read('words.txt')
words = words.gsub('"','').split(',')

triangle_nums = (1..25).map { |n| n*(n+1) / 2 }

triangle_count = 0
words.each do |word|
  sum = 0
  word.each_byte { |b|
    sum += b-64
  }
  triangle_count += 1 if triangle_nums.include?(sum)
  puts 'TOO HIGH' if sum > triangle_nums.max
end

puts "number of triangle words: #{triangle_count}"
