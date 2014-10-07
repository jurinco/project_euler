lim = 500 # max length for any side when p <= 1000

counts = Hash.new(0)
(2..lim).each do |a|
  (a..lim).each do |b|
    c = Math.sqrt(a**2 + b**2)
    next if c % 1 != 0
    perim = (a+b+c).to_i
    next if perim > 1000
    counts[perim] += 1
  end
end

# Test Case
p [counts[120], counts[120] == 3]

max = counts.max_by { |k,v| v }
p max[0] # => 840
