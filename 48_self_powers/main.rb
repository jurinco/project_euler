require 'benchmark'

puts Benchmark.measure {
  puts (1..1000).map { |x| x**x }.reduce(:+) % 10_000_000_000
}

