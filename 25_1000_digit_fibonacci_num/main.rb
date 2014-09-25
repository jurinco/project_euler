
fib1 = 1
fib2 = 1
term_count = 2

while fib2.to_s.length < 1_000
  term_count += 1
  new_fib = fib1 + fib2
  fib1 = fib2
  fib2 = new_fib
end

puts "fib.length: #{fib2.to_s.length}"
puts "fib: #{fib2}"

puts "term: #{term_count}"
