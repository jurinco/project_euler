def int_to_sorted_arr(n)
  n.to_s.chars.sort
end

def permuted_multiple(mult)
  i = 1
  loop do
    i_sorted_arr = int_to_sorted_arr(i)
    return i if mult.all? { |n| int_to_sorted_arr(i*n) == i_sorted_arr }
    i += 1
  end
end

p [permuted_multiple([2]), permuted_multiple([2]) == 125874]

p permuted_multiple([2,3,4,5,6]) # => 142857

