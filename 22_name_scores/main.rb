names = File.read('names.txt')
names = names.scan(/\w+/).sort!

def sum_of_chars(str)
  str.each_codepoint.reduce(0) { |sum,char| sum + char-64 }
end

# Test Cases
p [names[937], names[937] == 'COLIN']
p [sum_of_chars(names[937]), sum_of_chars(names[937]) == 53]

sum = 0
names.each_with_index do |name, i|
  sum += (i+1) * sum_of_chars(name)
end

p sum # => 871198282
