require 'prime'

# A number cannot be prime if the sum of its digits is divisible by 3.
# Therefore, only primes with lengths 1, 4, and 7 can be n-digit pandigital.
def pandigital_lengths
  (1..9).to_a.keep_if { |i|
    sum = (1..i).reduce(:+)
    sum % 3 != 0
  }
end

# Start with the max value and check if successively smaller n-digit pandigitals are prime
def largest_pandigital
  lengths = pandigital_lengths
  lengths.reverse.each do |l|
    digits = ('1'..l.to_s).to_a.reverse
    digits.permutation.each do |p|
      p = p.join.to_i
      return p if p.prime?
    end
  end
end

p largest_pandigital # => 7652413
