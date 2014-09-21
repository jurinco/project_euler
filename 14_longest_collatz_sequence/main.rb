require_relative 'collatz'
require_relative '../common/euler'
include Euler

limit = 1_000_000
longest = benchmark { longest_collatz(limit) }

puts "longest collatz under #{number_with_underscore_delimiter(limit)}: #{longest[0]} => #{longest[1]}"
