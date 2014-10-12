require_relative '../common/euler'
include Euler


def has_valid_end?(n)
  n % 100 >= 10
end

# Find the polygonal with the least num of values with 4 digits
counts = Hash.new { |h,k| h[k] = 0 }
(1010..9999).each do |n|
  (3..8).each { |s|
    counts[s] += 1 if n.polygonal?(s) && has_valid_end?(n)
  }
end
counts.min_by { |k,v| v }



# def build(chain, polys=[3,4,5])
#   chain = [chain] unless chain.class == Array
#   first = chain.last % 100 * 100

#   if polys.length == 1
#     last = chain.first / 100
#     num = first + last
#     if num.polygonal?(polys.first)
#       puts "#{chain + [num]} FINISHED"
#       return num
#     end
#   else
#     (10..99).each do |i|
#       num = first + i
#       polys.each do |p|
#         if num.polygonal?(p)
#           new_polys = polys.select { |x| x != p }
#           build(chain + [num], new_polys)
#         end
#       end
#     end
#   end
# end

def build(chain, polys=[3,4,5])
  chain = [chain] unless chain.class == Array
  first = chain.last % 100 * 100

  if polys.length == 1
    last = chain.first / 100
    num = first + last
    if num.polygonal?(polys.first)
      puts "#{chain + [num]} FINISHED"
      return num
    end
  else
    (10..99).each do |i|
      num = first + i
      p = polys.first
      if num.polygonal?(p)
        build(chain + [num], polys[1..-1])
      end
    end
  end
end


p3s = []
(1010..9999).each do |n|
  p3s << n if n.polygonal?(3) && has_valid_end?(n)
end
p3s.each do |p|
  build(p, polys=[4,5])
end
# [2556, 5612, 1225]
# [8128, 2882, 8281]
# [8515, 1521, 2185]


p4s = []
(1010..9999).each do |n|
  p4s << n if n.polygonal?(4) && has_valid_end?(n)
end
p4s.each do |p|
  build(p, polys=[3,5])
end
# [1225, 2556, 5612]
# [1521, 2185, 8515]
# [8281, 8128, 2882]


p5s = []
(1010..9999).each do |n|
  p5s << n if n.polygonal?(5) && has_valid_end?(n)
end
p5s.each do |p|
  build(p, polys=[3,4])
end
# [2185, 8515, 1521]
# [2882, 8281, 8128]
# [5612, 1225, 2556]




p4s.each do |p|
  build(p, polys=[3,5,6,7,8])
end
# [1156, 5612, 1240, 4095, 9517, 1711]
# [1156, 5612, 1240, 4095, 9517, 1711]
# [1296, 9633, 3321, 2146, 4656, 5612]
# [1296, 9633, 3321, 2146, 4656, 5612]
# [1521, 2147, 4753, 5359, 5985, 8515]
# [1521, 2147, 4753, 5359, 5985, 8515]
# [1681, 8128, 2850, 5017, 1782, 8216]
# [1681, 8128, 2850, 5017, 1782, 8216]
# [2116, 1617, 1729, 2926, 2628, 2821]
# [2116, 1617, 1729, 2926, 2628, 2821]
# [2116, 1617, 1782, 8256, 5633, 3321]
# [2116, 1617, 1782, 8256, 5633, 3321]
# [2116, 1653, 5359, 5922, 2211, 1121]
# [2116, 1653, 5359, 5985, 8533, 3321]
# [2116, 1653, 5359, 5922, 2211, 1121]
# [2116, 1653, 5359, 5985, 8533, 3321]
# [3364, 6426, 2628, 2882, 8256, 5633]
# [3364, 6426, 2628, 2882, 8256, 5633]
# [4624, 2420, 2016, 1633, 3321, 2146]
# [4624, 2420, 2016, 1633, 3321, 2146]
# [5041, 4141, 4181, 8177, 7750, 5050]
# [5041, 4141, 4181, 8177, 7750, 5050]
# [5041, 4181, 8128, 2839, 3916, 1650]
# [5041, 4181, 8128, 2839, 3916, 1650]
# [5625, 2512, 1281, 8128, 2882, 8256]
# [5625, 2512, 1281, 8128, 2882, 8256]
# [6724, 2415, 1520, 2016, 1633, 3367]
# [6724, 2415, 1540, 4033, 3367, 6767]
# [6724, 2415, 1596, 9633, 3367, 6767]
# [6724, 2415, 1596, 9640, 4033, 3367]
# [6724, 2415, 1520, 2016, 1633, 3367]
# [6724, 2415, 1540, 4033, 3367, 6767]
# [6724, 2415, 1596, 9633, 3367, 6767]
# [6724, 2415, 1596, 9640, 4033, 3367]
# [7056, 5612, 1240, 4095, 9517, 1770]
# [7056, 5612, 1240, 4095, 9517, 1770]
# [7921, 2133, 3321, 2145, 4565, 6579]
# [7921, 2133, 3321, 2145, 4565, 6579]
# [8836, 3655, 5551, 5125, 2556, 5688]
# [8836, 3655, 5551, 5125, 2556, 5688]

[1156, 5612, 1240, 4095, 9517, 1711].map { |n| n.polygonal?(3) }
[4, 5, 1240, 4095, 9517, 3]


p3s.each do |p|
  build(p, [4,5,6,7,8])
end
[8515, 1521, 2147, 4753, 5359, 5985].map { |n| n.polygonal?(3) }

p3s.each do |p|
  build(p, [4,5,6,7,8].reverse)
end


p3s.each do |p|
  build(p, [4,5])
end
[8515, 1521, 2185].map { |n| n.polygonal?(3) }

p3s.each do |p|
  build(p, [5,4])
end
