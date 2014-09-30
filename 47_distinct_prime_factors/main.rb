require 'prime'

# # 2 consecutive nums with 2 distinct prime factors
# (1..1_000).find { |n|
#   n.prime_division.length == 2 && n.next.prime_division.length == 2
# }


# # 3 consecutive nums with 3 distinct prime factors
# (1..1_000).find { |n|
#   n.prime_division.length == 3 &&
#     (n+1).prime_division.length == 3 &&
#     (n+2).prime_division.length == 3
# }


puts (1..1_000_000).find { |n|
  n.prime_division.length == 4 &&
    (n+1).prime_division.length == 4 &&
    (n+2).prime_division.length == 4 &&
    (n+3).prime_division.length == 4
}
