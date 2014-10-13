class Integer
  def num_of_digits
    Math.log10(self).floor + 1
  end
end

def cube_permutations(target_count)
  cubes = Hash.new { |h,k| h[k] = [] }
  n = 3
  size = 2
  loop do
    c = n**3
    digits_count = c.num_of_digits
    if digits_count > size
      cubes.clear
      size += 1
    end

    key = c.to_s.chars.sort.join.to_i
    cubes[key] << c
    if cubes[key].count == target_count
      return cubes[key].sort
    end
    n += 1
  end
end


# Test Case
p [cube_permutations(3), cube_permutations(3) == [41063625, 56623104, 66430125]]
p [cube_permutations(5).min, cube_permutations(5).min == 127035954683]

p cube_permutations(5).min # => 127035954683
