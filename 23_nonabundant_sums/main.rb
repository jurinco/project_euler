require_relative '../common/euler'
include Euler

upper_lim = 28_123

abundant_nums = []
(1..upper_lim).each do |n|
  abundant_nums << n if n.abundant?
end

sums = {}
abundant_nums.each_with_index do |x, i|
  abundant_nums[i..-1].each do |y|
    sum = x + y
    break if sum > upper_lim
    sums[sum] = true
  end
end

p (1..upper_lim).reject { |el| sums[el] }.reduce(:+) # => 4179871
