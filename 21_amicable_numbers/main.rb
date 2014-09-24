require_relative '../common/euler'
include Euler

sum = 0
(2..10_000).each { |n|
  t = proper_divisors(n).reduce(&:+)
  sum += n if t != n && proper_divisors(t).reduce(&:+) == n
}
puts "amicable_sum: #{sum}"

