cipher = File.read('cipher.txt')
cipher = cipher.strip.split(',').map(&:to_i)

def decrypt(key, cipher)
  char_ascii_codes = (32..126)
  cipher.each_with_index.map { |c,i|
    d = (c ^ key[i%3])
    return false unless char_ascii_codes.include?(d)
    d.chr
  }.join
end

common_words = ['and', 'the', 'that']

('aaa'..'zzz').each do |i|
  key = i.bytes
  plaintext = decrypt(key, cipher)
  if plaintext && common_words.all? { |w| plaintext.include?(w) }
    sum = plaintext.bytes.reduce(:+)
    p plaintext[0..50], sum # => 107359
  end
end
