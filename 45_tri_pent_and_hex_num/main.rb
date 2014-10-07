require_relative '../common/euler'
include Euler

n = 286
loop do
  t = triangular_num(n)
  if t.pentagonal? && t.hexagonal?
    puts t # => 1533776805
    break
  end
  n += 1
end
