cipher = File.read('cipher.txt')
cipher = cipher.strip.split(',').map(&:to_i)

common_words = ['and', 'the', 'that']

('aaa'..'zzz').each do |i|
  key = i.bytes
  plaintext = cipher.each_with_index.map { |l,i|
    (l ^ key[i%3]).chr
  }.join
  if common_words.all? { |w| plaintext.include?(w) }
    sum = plaintext.bytes.reduce(:+)
    p plaintext[0..50], sum
  end
end

