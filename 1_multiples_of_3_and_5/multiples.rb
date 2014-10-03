def multiples(limit=999)
  (1...limit).reduce(0) do |sum, n|
    if (n % 3 == 0 || n % 5 == 0)
      sum + n
    else
      sum + 0
    end
  end
end
