def max_path_sum(data)
  row_count = data.length-1
  (row_count-1).downto(0).each do |i|
    data[i].each_index do |j|
      data[i][j] += [data[i+1][j], data[i+1][j+1]].max
    end
  end
  data[0][0]
end
