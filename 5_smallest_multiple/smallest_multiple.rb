def smallest_multiple(values)
  min = values.max
  max = values.reduce(:*)

  (min..max).step(min).each do |n|
    return n if values.select { |v| n % v != 0 }.empty?
  end
end
