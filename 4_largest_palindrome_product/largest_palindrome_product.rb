def largest_palindrome_product(size)
  n_high = 10 ** size - 1
  n_low =  10 ** (size - 1)
  largest_pal = [1,1,1]

  n_high.downto(n_low).each do |x|
    x.downto(n_low).each do |y|
      prod = x * y
      if palindrome?(prod) && largest_pal[2] < prod
        largest_pal = [x, y, prod]
        return largest_pal if x < largest_pal[0] && y < largest_pal[1]
      end
    end
  end
  largest_pal
end

def palindrome?(s)
  s.to_s == s.to_s.reverse
end
