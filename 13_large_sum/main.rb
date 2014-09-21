numbers = []
File.open('data', 'r') do |f|
  f.each_line do |line|
    numbers << line
  end
end

numbers.map! { |n| n[0..12].to_i }
sum = numbers.reduce(:+)
puts sum.to_s[0, 10]
