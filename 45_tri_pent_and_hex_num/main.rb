require_relative '../common/euler'
include Euler

n = 286
result = nil
until result do
  x = triangular_num(n)
  if pentagonal_num?(x) && hexagonal_num?(x)
    result = n
    puts "x: #{x}"
  end
  n += 1
end
