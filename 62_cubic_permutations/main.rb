class Integer
  def num_of_digits
    Math.log10(self).floor + 1
  end
end


def get_cubes(size)
  cubes = Hash.new { |h,k| h[k] = [] }

  n = 3
  loop do
    c = n**3
    digits_count = c.num_of_digits
    if digits_count > size
      break
    elsif digits_count >= size
      key = c.to_s.chars.sort.join.to_i
      cubes[key] << c
    end
    n += 1
  end
  cubes
end

def cube_permutations(count)
  n = 3
  loop do
    cubes = get_cubes(n)
    result = cubes.select { |k,v| v.count == count }
    return result.values.map { |vals| vals.sort }.min unless result.empty?
    n += 1
  end
end

# Test Case
p [cube_permutations(3), cube_permutations(3) == [41063625, 56623104, 66430125]]

p cube_permutations(5).min # =>
