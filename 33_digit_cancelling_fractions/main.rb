# Insights
# The numerator must be a 2-digit number
# denominator >= numerator + 9
def digit_canceling_fractions
  fractions = []
  (11..99).each do |n|
    (n+9..99).each do |d|
      next if d % 10 == 0
      n0, d0 = n/10, d/10
      n1, d1 = n%10, d%10
      r = Rational(n,d)
      if n1 == d0 && r == Rational(n0, d1)
        fractions << [n,d,r]
      end
    end
  end
  fractions
end

fractions = digit_canceling_fractions
fractions.each { |frac| p frac }

# Test Case
test_frac = [49, 98, Rational('4/8')]
p [test_frac, fractions.include?(test_frac) == true]


# Multiply rational fractions and find denominator
p fractions.map { |frac| frac[2] }.reduce(:*).denominator # => 100
