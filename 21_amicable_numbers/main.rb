require_relative '../common/euler'
include Euler

sum = 0
(2..10_000).each { |n|
  t = n.proper_divisors.reduce(&:+)
  sum += n if t != n && t.proper_divisors.reduce(&:+) == n
}
p sum # => 31626
