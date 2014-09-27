def palindrome?(str)
  str == str.reverse
end

palindromes = []
(1..1_000_000).each do |n|
  palindromes << n if palindrome?(n.to_s) && palindrome?(n.to_s(2))
end

puts "sum: #{palindromes.reduce(:+)}"
