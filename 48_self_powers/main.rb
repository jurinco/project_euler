result = (1..1000).map { |x| x**x }.reduce(:+) % 10_000_000_000
p result # => 9110846700
