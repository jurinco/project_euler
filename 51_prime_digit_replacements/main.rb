require 'prime'
require 'benchmark'

goal_count = 8
max_count = 0
max_prime = 0
max_indices = [0,0]

Prime.each do |p|
  p = p.to_s
  (0..p.length-2).each do |i|
    (i..p.length-2).each do |j|
      break unless p[i] == p[j]
      start_d = i == 0 ? '1' : '0'
      count = (start_d..'9').count { |n|
        new_val = p[0...i] + n * (j-i+1) + p[j+1..-1]
        new_val.to_i.prime?
      }
      if count > max_count
        max_count = count
        max_prime = p
        max_indices = [i,j]
        puts "max_count #{max_count},  max_prime: #{max_prime}, indices: #{max_indices.join(' ')}"
      end
    end
  end
  break if max_count == goal_count
end

puts "max_count #{max_count},  max_prime: #{max_prime}, indices: #{max_indices.join(' ')}"





max_count = 0
max_primes = []
d_range = %w(0 _ 1 2 3 4 5 6 7 8 9)

d_range.each do |a|
  d_range.each do |b|
    d_range.each do |c|
      d_range.each do |d|
        next unless (a+b+c+d).include?('_')

        %w(1 3 7 9).each do |e|
          num = a+b+c+d+e
          num.sub!(/^0*/, '')
          # puts "num1: #{num}"
          digits = num[0] == '_' ? ('1'..'9') : ('0'..'9')
          count = digits.count { |d|
            # puts "#{num.gsub('_',d)}, prime? #{num.gsub('_',d).to_i.prime?}"
            num.gsub('_',d).to_i.prime?
          }
          if count > max_count
            max_count = count
            puts "num: #{num}, count: #{count}"
            max_primes =
              digits.map { |d|
                num.gsub('_',d).to_i
              }.select { |n| n.prime? }.sort
          end
        end

      end
    end
  end
end

puts "max_count #{max_count}"
puts "max_primes #{max_primes}"

