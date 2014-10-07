require 'prime'

# Return the first n consecutive numbers with n distinct prime factors
def consec_nums(n)
  i = 1
  loop do
    return (i...i+n).to_a if (i...i+n).all? { |x| x.prime_division.length == n }
    i += 1
  end
end

p [consec_nums(2), consec_nums(2) == [14,15]]
p [consec_nums(3), consec_nums(3) == [644,645,646]]

p consec_nums(4).first # => 134043
