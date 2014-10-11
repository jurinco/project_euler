# Insights
# Maps well to graph theory
# Create a graph with a node for each prime and connect nodes which have property P
# P, when primes p and q are concatenated, in any order, the concatendation is also prime

require 'prime'
require 'benchmark'
require_relative '../common/euler'

puts Benchmark.measure {
  primes = Prime.take_while { |p| p < 9_000 }.map(&:to_s)
  primes.delete('2')
  primes.delete('5')

  # Build graph
  g = Hash.new { |h,k| h[k] = [] }

  primes.each_with_index do |p,i|
    primes[i+1..-1].each { |q|
      if (p+q).to_i.prime? && (q+p).to_i.prime?
        g[p] << q
        g[q] << p
      end
    }
  end

  # Build 3-cliques
  c3 = []
  g.each do |k, ns|
    ns.each do |n|
      intersect = [k,n].map { |v| g[v] }.reduce(:&)
      intersect.each do |m|
        c3 << [k,n,m].sort
      end
    end
  end
  c3.uniq!

  # Build 4-cliques
  c4 = []
  c3.each do |ns|
    intersect = ns.map { |v| g[v] }.reduce(:&)
    intersect.each do |m|
      c4 << (ns + [m]).sort
    end
  end
  c4.uniq!

  # Build 5-cliques
  c5 = []
  c4.each do |ns|
    intersect = ns.map { |v| g[v] }.reduce(:&)
    intersect.each do |m|
      c5 << (ns + [m]).sort
    end
  end
  c5.uniq!

  p c5.map { |vs| vs.map(&:to_i).reduce(:+) }.min # => 26033
}

# p [find_clique(g,4), find_clique(g,4) == [3,7,109,673]]
