require 'benchmark'

puts Benchmark.measure {
  lim = 10_000
  @pantagonals = {}
  (1..lim).each do |n|
    p = n * (3*n-1) / 2
    @pantagonals[p] = true
  end
  @p_keys = @pantagonals.keys

  def find_first(lim)
    (1..lim-1).each do |i|
      p1 = @p_keys[i]
      (i+1..lim-1).each do |j|
        p2 = @p_keys[j]
        return [p1, p2] if @pantagonals[p1+p2] && @pantagonals[p2-p1]
      end
    end
    nil
  end

  p1, p2 = find_first(lim)
  puts "p1: #{p1}"
  puts "p2: #{p2}"
  puts "sum: #{p1+p2}"
}
