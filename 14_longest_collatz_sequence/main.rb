require_relative 'collatz'
require_relative '../common/euler'
require 'benchmark'

include Euler

limit = 10_000

Benchmark.measure {
  longest = benchmark { longest_collatz(limit) }
  puts "longest collatz under #{number_with_underscore_delimiter(limit)}: #{longest[0]} => #{longest[1]}"
}
