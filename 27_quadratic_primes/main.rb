require 'prime'

limit = 999

max = Array.new(3,0)  # [a, b, n]

(-limit..limit).each do |a|
  (-limit..limit).each do |b|
    n = 0
    while (n**2 + n*a + b).prime?
      n += 1
    end
    max = [a, b, n-1] if n-1 > max[2]
  end
end
puts "a: #{max[0]}"
puts "b: #{max[1]}"
puts "n: #{max[2]}"
