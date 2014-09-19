require_relative '../common/euler'

include Euler

tri_nums = Enumerator.new do |y|
  index = 0
  sum = 0
  loop do
    index += 1
    sum += index
    y.yield sum
  end
end

beginning_time = Time.now
solution = tri_nums.find { |t|
  factors(t).length > 500
}
puts "solution: #{solution}"

end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)} seconds"
