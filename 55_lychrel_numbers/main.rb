class String
  def palindrome?
    self == self.reverse
  end
end

class Integer
  def reverse
    self.to_s.reverse.to_i
  end
end

# Sum n with its reverse until the result is palindromic
def r_add(n, limit=50)
  i = 1
  while i <= limit
    n += n.reverse
    return [n, i] if n.to_s.palindrome?
    i += 1
  end
end

# Test Cases
p [r_add(47), r_add(47) == [121,1]]
p [r_add(349), r_add(349) == [7337,3]]
p [r_add(10677, limit=54), r_add(10677, limit=54) == [4668731596684224866951378664,53]]
p [r_add(4994), r_add(4994) == nil]

p (1..10_000).count { |n| r_add(n).nil? } # => 249
