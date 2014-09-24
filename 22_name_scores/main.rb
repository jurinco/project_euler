names = []
File.open('names.txt', 'r') do |f|
  f.each_line do |line|
    names = line
  end
end

names = names.gsub('"','').split(',').sort

def sum_of_chars(str)
  sum = 0
  str.each_codepoint { |c| sum += c-64 }
  sum
end

total = 0
names.each_with_index do |name, i|
  total += (i+1) * sum_of_chars(name)
end
puts "total: #{total}"
