require_relative '../common/euler'
include Euler

n = 286
result = nil
until result do
  x = triangular_num(n)
  if x.pentagonal? && x.hexagonal?
    result = n
    puts "x: #{x}"
  end
  n += 1
end
