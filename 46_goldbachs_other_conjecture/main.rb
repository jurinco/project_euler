require 'prime'

odd_composite_nums =
  Enumerator.new do |y|
    n = 3
    loop do
      n += 2 while n.prime?
      y.yield n
      n += 2
    end
  end

result =
  odd_composite_nums.find do |c|
    max_s = Math.sqrt(c).to_i
    (1..max_s).find do |s|
      p = c - 2 * s**2
      p > 0 && p.prime?
    end == nil
  end

puts result # => 5777
