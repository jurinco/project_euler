def largest_product_in_a_series(series, length)
  series = series.split('') if series.class == String
  largest = 0

  start = 0
  stop = length-1
  while stop < series.length
    candidate = series_product(series[start..stop])
    largest = candidate if candidate > largest

    start += 1
    stop += 1
  end

  largest
end

def series_product(series)
  series.map { |n| n.to_i }.reduce(:*)
end
