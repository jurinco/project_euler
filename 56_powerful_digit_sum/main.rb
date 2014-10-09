require_relative '../common/euler'
include Euler

max = 0
(1..100).max_by do |a|
  (1..100).each do |b|
    sum = (a**b).digital_sum
    max = sum if sum > max
  end
end

p max # => 972
