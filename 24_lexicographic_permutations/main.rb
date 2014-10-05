a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

a.permutation.each_with_index do |p, i|
  if i == 1_000_000-1
    puts p.join.to_i # => 2783915460
    break
  end
end
