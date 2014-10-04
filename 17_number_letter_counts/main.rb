def number_to_words(n)
  return 'zero' if n == 0
  nums = %w(nil one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  sig = %w(nil nil twenty thirty forty fifty sixty seventy eighty ninety)

  result = []
  if n >= 1000
    result << "#{nums[n/1000]} thousand"
    n %= 1000
    result << 'and' if n > 0
  end

  if n >= 100
    result << "#{nums[n/100]} hundred"
    n %= 100
    result << 'and' if n > 0
  end

  if n >= 20
    result << sig[n/10]
    n %= 10
  end

  if n > 0
    result << nums[n]
  end

  result.join(' ')
end

def sum_range_of_words(range)
  words = range.map { |n| number_to_words(n) }
  words.reduce(0) { |sum, w| sum + w.gsub(' ', '').length }
end

# Test Cases
p [number_to_words(342), number_to_words(342) == 'three hundred and forty two']
p [number_to_words(115), number_to_words(115) == 'one hundred and fifteen']
p [sum_range_of_words(1..5), sum_range_of_words(1..5) == 19]

p sum_range_of_words(1..1000) # => 21124
