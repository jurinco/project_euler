# Insights
# Maps well to graph theory
# Create a graph with a node for each prime and connect nodes which have property P
# P, when primes p and q are concatenated, in any order, the concatendation is also prime

require 'prime'
require 'benchmark'

puts Benchmark.measure {
  # Take primes > 2
  primes = Prime.take_while { |p| p <= 9_000 }
  primes.delete(2)
  primes.map!(&:to_s)

  # Build graph
  g = Hash.new { |h,k| h[k] = [] }

  primes.each_with_index do |p,i|
    primes[i+1..-1].each { |q|
      if (p+q).to_i.prime? && (q+p).to_i.prime?
        g[p.to_i] << q.to_i
        g[q.to_i] << p.to_i
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
  p c5.uniq!
  p c5.map { |vs| vs.reduce(:+) }.min
}

# p [find_clique(g,4), find_clique(g,4) == [3,7,109,673]]
