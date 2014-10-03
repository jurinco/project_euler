def largest_palindrome_product(num_of_digits)
  upper_lim = 10 ** num_of_digits - 1
  lower_lim =  10 ** (num_of_digits - 1)
  result = [1,1,1] # [x, y, product]

  upper_lim.downto(lower_lim).each do |x|
    x.downto(lower_lim).each do |y|
      prod = x * y
      if palindrome?(prod) && result[2] < prod
        result = [x, y, prod]
        return result if x < result[0] && y < result[1]
      end
    end
  end
  result
end

def palindrome?(s)
  s.to_s == s.to_s.reverse
end

# Test Cases
p [largest_palindrome_product(1), largest_palindrome_product(1) == [9, 1, 9]]
p [largest_palindrome_product(2), largest_palindrome_product(2) == [99, 91, 9009]]

p largest_palindrome_product(3)[2]
