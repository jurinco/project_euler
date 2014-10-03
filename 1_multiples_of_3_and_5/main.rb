# Find the sum of all the multiples of 3 or 5 below 1000
def multiples(limit=1_000)
  (1...limit).reduce(0) do |sum, n|
    if (n % 3 == 0 || n % 5 == 0)
      sum + n
    else
      sum + 0
    end
  end
end

# Tests
p [multiples(10), multiples(10) == 23]
p [multiples(15), multiples(15) == 45]

p multiples
