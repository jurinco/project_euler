require 'prime'

# Find the prime under limit with that equals the sum of the most consecutive primes.
# Return the prime and the number of consecutive primes
def longest(limit)
  primes = Prime.take_while { |p| p <= limit / 3 }

  max_sum = 0
  max_len = 0
  primes_last_i = primes.count-1

  (0..primes_last_i).each do |i|
    sum = 0
    j = i
    next if (primes_last_i - i) < max_len
    while j <= primes_last_i
      len = j+1 - i
      sum += primes[j]
      break if sum > limit
      if len > max_len && sum.prime?
        max_len = len
        max_sum = sum
      end
      j += 1
    end
  end
  [max_sum, max_len]
end

# Test Cases
p [longest(100), longest(100) == [41, 6]]
p [longest(1000), longest(1000) == [953, 21]]

p longest(1_000_000)[0] # => 997651
