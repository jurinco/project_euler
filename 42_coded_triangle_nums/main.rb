words = File.read('words.txt').scan(/\w+/)

triangle_nums = (1..25).map { |n| n*(n+1) / 2 }

triangle_words =
  words.select { |word|
    sum = word.each_byte.reduce(0) { |sum,b| sum + b - 64 }
    triangle_nums.include?(sum)
  }

# Test Case
p ['SKY', triangle_words.include?('SKY') == true]
p ['ART', triangle_words.include?('ART') == false]

p triangle_words.count # => 162
