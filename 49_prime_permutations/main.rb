require 'prime'

primes_permuts = []
Prime.each do |p|
  next if p < 1_000
  break if p >= 3_330
  p_str = p.to_s.split(//).sort.join
  p2 = p + 3330
  if p2.prime? && p2.to_s.split(//).sort.join == p_str
    p3 = p2 + 3330
    if p3.prime? && p3.to_s.split(//).sort.join == p_str
      primes_permuts << [p,p2,p3]
    end
  end
end


primes_permuts.each do |primes|
  puts "#{primes.join(' ')},  concat: #{primes.join}"
end
