# Insights
# The rational representation of the series is similar to the fibonacci sequence

def expand_expression(limit)
  num, denom = 1, 1

  limit.times.collect do
    new_denom = num + denom
    num = new_denom + denom
    denom = new_denom
    [num, denom]
  end
end

# Return the count of fractions where the numerator has more digits than the denominator
def count(vals)
  vals.count { |n,d| n.to_s.length > d.to_s.length }
end

# Test Cases
fractions = expand_expression(8)
expected = [[3,2], [7,5], [17,12], [41,29], [99,70], [239,169], [577,408], [1393,985]]
(0..7).each do |i|
  p [fractions[i], fractions[i] == expected[i]]
end
p [count(fractions), count(fractions) == 1]

p count(expand_expression(1_000)) # => 153
