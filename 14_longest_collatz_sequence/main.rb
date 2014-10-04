require 'benchmark'

def collatz_length(n)
  length = 1
  while n > 1
    length += 1
    if n % 2 == 0
      n /= 2
    else
      n = n * 3 + 1
    end
  end
  length
end

def longest_collatz(limit = 1_000_000)
  longest = [1,1]
  (2..limit).each do |n|
    length = collatz_length(n)
    longest = [n, length] if length > longest[1]
  end
  longest
end

# Test Case
p [collatz_length(13), collatz_length(13) == 10]

puts Benchmark.measure {
  puts "result: #{longest_collatz(1_000_000)[0]}" # => 837799
}
