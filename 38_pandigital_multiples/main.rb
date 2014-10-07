def pandigital_concat(n)
  digits = n.to_s
  (2..9).each do |i|
    break if digits.length >= 9
    digits += (n * i).to_s
  end
  if digits.length == 9 && digits.split(//).sort == %w(1 2 3 4 5 6 7 8 9)
    return digits.to_i
  end
  nil
end

# Test Cases
p [pandigital_concat(192), pandigital_concat(192) == 192384576]
p [pandigital_concat(9), pandigital_concat(9) == 918273645]

max = 0
(2..9_999).each do |n|
  result = pandigital_concat(n) || 0
  max = result if result > max
end

p max # => 932718654
