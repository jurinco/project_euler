# def multiples(limit=999)
#   sum = 0
#   (1...limit).each do |n|
#     if (n % 3 == 0) || (n % 5 == 0)
#       sum += n
#     end
#   end
#   sum
# end

# def multiples(limit=999)
#   (1...limit).reduce(0) { |sum, n|sum + ((n % 3 == 0 || n % 5 == 0) ? n : 0) }
# end


def multiples(limit=999)
  (1...limit).reduce(0) do |sum, n|
    if (n % 3 == 0 || n % 5 == 0)
      sum + n
    else
      sum + 0
    end
  end
end
