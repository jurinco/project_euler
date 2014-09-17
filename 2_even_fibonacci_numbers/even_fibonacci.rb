def even_fibonacci(limit=4_000_000)
  fib1 = 1
  fib2 = 1
  sum = 0

  while fib2 < limit
    new_fib = fib1 + fib2
    fib1 = fib2
    fib2 = new_fib
    sum += fib1 if fib1 % 2 == 0
  end

  return sum
end
