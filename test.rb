require 'prime'
require 'benchmark'

primes = []
lim = 1_000_000
Prime.each do |p|
  primes << p
  break if p > lim / 3
end

puts Benchmark.measure {
10.times {
  max_length = 0
  max_prime = 0

  (0..primes.length-1).each do |index|
    i = index
    sum = 0
    loop do
      sum += primes[i]
      i += 1
      if i - index > max_length and sum.prime?
        max_length = i - index
        max_prime = sum
        p "#{primes[index]}: #{max_length}, #{max_prime}"
      end
      if sum > lim or index + max_length > primes.length
        break
      end
    end
  end
}
}
