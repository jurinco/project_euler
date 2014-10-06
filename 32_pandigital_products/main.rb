def pandigital_products(limit)
  products = []
  (1..limit).each do |i|
    (i+1..limit).each do |j|
      digits = [i, j, i*j].map { |n| n.to_s.split('') }.flatten
      break if digits.length > 9
      if digits.sort.join == '123456789'
        products << [i, j, i*j]
      end
    end
  end
  products
end

vals = pandigital_products(10_000)

# Test Case
p [[39,186,7254], vals.include?([39,186,7254]) == true]

# Sum uniq products
sum = vals.map { |x| x[2] }.uniq.reduce(:+)
p sum # => 45228
