require 'benchmark'
require_relative '../common/euler'
include Euler

limit = 28_123
abundant_numbers = []
(12..limit).each do |n|
  abundant_numbers << n if n.abundant_number?
end

sums = []
abundant_numbers.each do |x|
  abundant_numbers.each do |y|
    sum = x+y
    sums << sum if sum <= limit
  end
end
sums.sort!.uniq!

puts Benchmark.measure {
  puts (1..limit).reject { |el| sums.include?(el) }.reduce(:+)
}
