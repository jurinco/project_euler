dim = 1001

m = 2
corner_count = 0
sum = 0
(1..dim**2).each do |n|
  if (n - 1) % m == 0
    sum += n
    corner_count += 1
    if corner_count == 4
      m += 2
      corner_count = 0
    end
  end
end

puts "sum: #{sum}"
