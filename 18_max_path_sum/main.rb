def max_path_sum(data)
  d = Marshal.load(Marshal.dump(data))
  d.object_id
  row_count = d.length-1
  (row_count-1).downto(0).each do |i|
    d[i].each_index do |j|
      d[i][j] += [d[i+1][j], d[i+1][j+1]].max
    end
  end
  d[0][0]
end

# Test Case
data = [[3],[7,4],[2,4,6],[8,5,9,3]]
p [max_path_sum(data), max_path_sum(data) == 23]

data = []
File.open('data', 'r') do |f|
  f.each_line do |line|
    data << line.split.map(&:to_i)
  end
end
p max_path_sum(data) # => 1074
