fractions = []
(11..99).each do |n|
  next if n % 10 == 0
  (n+1..99).each do |d|
    next if d % 10 == 0
    r = Rational(n,d)

    n0, d0 = n/10, d/10
    n1, d1 = n%10, d%10

    if n1 == d0 && r == Rational(n0, d1)
      puts [n, d, r].join(' ')
      fractions << r
    end
  end
end
puts "fractions: #{fractions.join(' ')}"
puts "denominator of the fractions product: #{fractions.reduce(:*).denominator}"
