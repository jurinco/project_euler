limit = 500

# vals = Hash.new([])
counts = Hash.new(0)
(2..limit).each do |a|
  (a..limit).each do |b|
    c = Math.sqrt(a**2 + b**2)
    perim = (a+b+c).to_i
    next if perim > 1000
    if c % 1 == 0
      # vals[perim] += [[a, b, c.to_i]]
      counts[perim] += 1
    end
  end
end

max = counts.values.max
# counts.select { |k,v| v == max }
perim = counts.key(max)
puts "perim with max number of solutions: #{perim}"
