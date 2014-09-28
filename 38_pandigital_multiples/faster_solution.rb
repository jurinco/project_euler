def pandigital_concat(n)
  s = ''
  (1..9).each do |m|
    s += (n * m).to_s
    break if s.length >= 9
  end
  if s.length == 9 && s.split(//).sort.join == '123456789'
    return s.to_i
  end
  nil
end


max = 0
(2..100_000).each do |n|
  result = pandigital_concat(n) || 0
  max = result if result > max
end
