require 'prime'

primes_permuts = []
Prime.each do |p|
  next if p < 1_000
  break if p >= 3_330
  p_str = p.to_s.chars.sort.join
  p2 = p + 3330
  if p2.prime? && p2.to_s.chars.sort.join == p_str
    p3 = p2 + 3330
    if p3.prime? && p3.to_s.chars.sort.join == p_str
      primes_permuts << [p,p2,p3]
    end
  end
end

# Test Case
p [[1487,4817,8147], primes_permuts.include?([1487,4817,8147]) == true]

puts primes_permuts[1].join # => 296962999629
