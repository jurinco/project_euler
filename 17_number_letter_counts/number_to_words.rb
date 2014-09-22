def number_to_words(n)
  return 'zero' if n == 0
  nums = %w(nil one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  sig = %w(nil nil twenty thirty forty fifty sixty seventy eighty ninety)

  result = []
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
