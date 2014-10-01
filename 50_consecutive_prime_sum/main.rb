require 'prime'
require 'benchmark'

# lim = 100 # 41
# lim = 1_000 # 953
# lim = 10_000 # 9521
# lim = 100_000 # 92951
lim = 1_000_000 # 997651

primes = []
Prime.each do |p|
  primes << p
  break if p > lim / 3
end

puts Benchmark.measure {
  max_sum = 0
  max_len = 0
  primes_last_i = primes.count-1

  (0..primes_last_i).each do |i|
    sum = 0
    j = i
    next if (primes_last_i - i) < max_len
    while j <= primes_last_i
      len = j+1 - i
      sum += primes[j]
      break if sum > lim
      if len > max_len && sum.prime?
        max_len = len
        max_sum = sum
        # puts "sum: #{sum}, len: #{max_len}"
      end
      j += 1
    end
  end

  puts "max sum: #{max_sum}"
}
