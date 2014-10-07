class String
  def palindrome?
    self == self.reverse
  end
end

palindromes =
  (1..1_000_000).find_all { |n|
    n.to_s.palindrome? && n.to_s(2).palindrome?
  }

# Test Case
p [585, palindromes.include?(585)]

p palindromes.reduce(:+) # => 872187
