require 'benchmark'

puts Benchmark.measure {
5.times {
  ('0'..'9').to_a.permutation.count
}
}

puts Benchmark.measure {
5.times {
  ('0'..'9').to_a.permutation(9).count
}
}
