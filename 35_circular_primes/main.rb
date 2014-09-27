require 'benchmark'
require 'prime'

puts Benchmark.measure {
  def rotations(n)
    m = n.to_s.length - 1 # magnitude

    rotations = []
    m.times do
      n0 = n / 10**m
      n_remain = n % 10**m
      n = n_remain * 10 + n0
      rotations << n
    end
    rotations
  end

  vals = []
  Prime.each do |n|
    break if n >= 1_000_000
    rotations = rotations(n)
    vals << n unless rotations.detect { |r| !r.prime? }
  end

  puts vals
  puts "count: #{vals.length}"
}
