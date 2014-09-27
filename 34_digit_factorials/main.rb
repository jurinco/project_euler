require 'benchmark'

class Integer
  def factorial
    return 1 if self == 0
    (1..self).reduce(:*)
  end
end

puts Benchmark.measure {
  factorials = (0..9).map { |d| d.factorial }

  # Find upper limit
  n = 1
  while factorials[9] * n > 10**n-1
    n += 1
  end
  limit = factorials[9] * n

  vals = []
  (10..limit).each do |n|
    digits = n.to_s.split('').map(&:to_i)
    fact_sum = digits.reduce(0) { |sum, d| sum + factorials[d] }
    vals << n if fact_sum == n
  end

  vals.each { |n| puts n }
  sum = vals.reduce(:+)
  puts "sum: #{sum}"
}
