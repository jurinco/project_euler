require_relative 'number_to_words'

words =
  (1..999).map { |n|
    number_to_words(n)
  }

words << 'one thousand'
puts words.reduce(0) { |sum, w| sum + w.gsub(' ', '').length }
