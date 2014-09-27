products = []

limit = 10_000
(1..limit).each do |i|
  j = i+1
  while j < limit
    digits = [i, j, i*j].map { |n| n.to_s.split('') }.flatten
    if digits.length > 9
      j = limit
    elsif digits.sort.join == '123456789'
      puts [i, j, i*j].join(' ')
      products << i*j
    end
    j += 1
  end
end

sum = products.uniq.reduce(:+)
puts "sum of products: #{sum}"

