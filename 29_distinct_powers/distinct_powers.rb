def distinct_powers(min, max)
  powers = []
  (min..max).each do |a|
    (min..max).each do |b|
      powers << a**b
    end
  end
  powers.sort.uniq
end
