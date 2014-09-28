def pandigital_product?(n, digits=nil)
  digits ||= [n.to_s.split('')]
  m = digits.length+1
  digits << (n * m).to_s.split('')

  d = digits.flatten.uniq.sort
  if digits.flatten.length != d.length || d.length > 9 || d.include?('0')
    return false
  elsif d.length < 9
    pandigital_product?(n, digits)
  else
    [true, digits.map { |product| product.join.to_i }]
  end
end

vals = {}
(2..100_000).each do |n|
  result, digits = pandigital_product?(n)
  vals[n] = digits if result
end

max = vals.map { |k,v| v.map(&:to_s).join }.max
puts "largest pandigital product: #{max}"
