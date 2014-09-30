words = File.read('words.txt').scan(/\w+/)

triangle_nums = (1..25).map { |n| n*(n+1) / 2 }

triangle_words =
  words.select { |word|
    sum = word.each_byte.reduce(0) { |sum,b| sum + b - 64 }
    triangle_nums.include?(sum)
  }

# TEST
# triangle_words.include?('SKY')

triangle_count = triangle_words.count
puts "number of triangle words: #{triangle_count}"
