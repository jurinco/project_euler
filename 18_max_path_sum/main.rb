require 'benchmark'
require_relative 'max_path_sum'

data = []
File.open('data', 'r') do |f|
  f.each_line do |line|
    data << line
  end
end

puts Benchmark.measure {
  data.map! { |line| line.split.map(&:to_i) }
  puts max_path_sum(data)
}
