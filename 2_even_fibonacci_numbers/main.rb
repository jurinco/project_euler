# Sum the even-valued terms of the Fibonacci sequence which have a value <= four million.
def sum_even_fibonacci(limit=4_000_000)
  n1 = 1
  n2 = 1
  sum = 0

  while n2 < limit
    new_n = n1 + n2
    n1 = n2
    n2 = new_n

    sum += n1 if n1.even?
  end

  sum
end

# Test cases
p [sum_even_fibonacci(10), sum_even_fibonacci(10) == 10]
p [sum_even_fibonacci(20), sum_even_fibonacci(20) == 10]
p [sum_even_fibonacci(100), sum_even_fibonacci(100) == 44]

p sum_even_fibonacci
