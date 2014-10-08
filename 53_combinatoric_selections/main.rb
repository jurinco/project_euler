require_relative '../common/euler'
include Euler

count = 0
(1..100).each do |n|
  (1..n-1).each do |r|
    count += 1 if binomial(n,r) > 1_000_000
  end
end

p count # => 4075
