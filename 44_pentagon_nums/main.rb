lim = 10_000

@pantagonals = {}
(1..lim).each do |n|
  p = n * (3*n-1) / 2
  @pantagonals[p] = true
end
@p_keys = @pantagonals.keys

def first_pentagonal_pair(lim)
  (1..lim-1).each do |j|
    p1 = @p_keys[j]
    (j+1..lim-1).each do |k|
      p2 = @p_keys[k]
      return [p1, p2] if @pantagonals[p1+p2] && @pantagonals[p2-p1]
    end
  end
  nil
end

p1, p2 = first_pentagonal_pair(lim)

puts p2 - p1 # => 5482660
