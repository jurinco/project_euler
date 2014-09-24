require_relative '../common/euler'
include Euler

puts factorial(100).to_s.split('').reduce(0) { |sum, d| sum + d.to_i }
