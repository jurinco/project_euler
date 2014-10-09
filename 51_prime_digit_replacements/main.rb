require 'prime'
require 'benchmark'

# Find the first "prime family" of size n
# Return the prime family sorted
def prime_family(size)
  primes = {}
  Prime.each { |p|
    primes[p] = true
    break if p > 150_000
  }

  Prime.each do |p|
    p = p.to_s
    (0..p.length-2).each do |i|
      (i..p.length-2).each do |j|
        # break unless p[i] == p[j]
        start_d = i == 0 ? '1' : '0'
        count = (start_d..'9').count { |n|
          new_val = p[0...i] + n * (j-i+1) + p[j+1..-1]
          # new_val.to_i.prime?
          primes[new_val.to_i]
        }
        if count == size
          # vals = (start_d..'9').map { |n|
          #   new_val = p[0...i] + n * (j-i+1) + p[j+1..-1]
          #   new_val.to_i
          # }.select {|n| n.prime? }
          vals = (start_d..'9').map { |n|
            new_val = p[0...i] + n * (j-i+1) + p[j+1..-1]
            new_val.to_i
          }.select {|n| primes[n] }
          return vals
        end
      end
    end
  end
  nil
end



def prime_family(size)
  primes = {}
  Prime.each { |p|
    primes[p] = true
    break if p > 150_000
  }

  d_range = %w(0 _ 1 2 3 4 5 6 7 8 9)

  d_range.each { |a|
    d_range.each { |b|
      d_range.each { |c|
        d_range.each { |d|
          d_range.each { |e|
            d_range.each { |f|
              next unless (a+b+c+d+e+f).include?('_')

              %w(1 3 7 9).each do |g|
                num = a+b+c+d+e+f+g
                num.sub!(/^0*/, '')
                # puts "num1: #{num}"
                digits = num[0] == '_' ? ('1'..'9') : ('0'..'9')
                count = digits.count { |d|
                  # puts "#{num.gsub('_',d)}, prime? #{num.gsub('_',d).to_i.prime?}"
                  # num.gsub('_',d).to_i.prime?
                  primes[num.gsub('_',d).to_i]
                }

                if count == size
                  # return digits.map { |d|
                  #   num.gsub('_',d).to_i
                  # }.select { |n| n.prime? }.sort
                  return digits.map { |d|
                    num.gsub('_',d).to_i
                  }.select { |n| primes[n] }.sort
                end
              end
            }}}}}}
end

puts Benchmark.measure {
  p [prime_family(6), prime_family(6) == [13,23,43,53,73,83]]
  p [prime_family(7), prime_family(7) == [56003,56113,56333,56443,56663,56773,56993]]

  p prime_family(8).first # => 121313
}
