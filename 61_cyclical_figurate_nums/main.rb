require_relative '../common/euler'
include Euler


def has_valid_end?(n)
  n % 100 >= 10
end

def build(chain, polys=[3,4,5])
  chain = [chain] unless chain.class == Array
  first = chain.last % 100 * 100

  if polys.length == 1
    last = chain.first / 100
    num = first + last
    if num.polygonal?(polys.first)
      # puts "#{chain + [num]}"
      return chain + [num]
    end
  else
    solutions = []
    (10..99).each do |i|
      num = first + i
      polys.each do |s|
        if num.polygonal?(s)
          new_polys = polys.select { |x| x != s }
          r = build(chain + [num], new_polys)
          solutions << r if r
        end
      end
    end
    solutions unless solutions.empty?
  end
end

# Test Case
ps =
  (1010..9999).select { |n|
    n.polygonal?(8) && has_valid_end?(n)
  }
ps.each { |p|
  r = build(p, polys=[3,4,5,6,7])
  p r if r
}


# # Test Case
# ps =
#   (1010..9999).select { |n|
#     n.polygonal?(5) && has_valid_end?(n)
#   }

# # p ps.select { |p|
# #   build(p, polys=[3,4])
# # }

# ps.each { |p|
#   r = build(p, polys=[3,4])
#   p r if r
# }


# ps =
#   (1010..9999).select { |n|
#     n.polygonal?(8) && has_valid_end?(n)
#   }

# ps.select { |p|
#   build(p, polys=[3,4,5,6,7])
# }
# # # => 28684

# ps.each { |p|
#   r = build(p, polys=[3,4,5,6,7])
#   p r if r
# }
