require 'date'

d = Date.new(1901, 1, 1)
sunday_count = 0
while d.year < 2001
  sunday_count += 1 if d.sunday?
  d >>= 1 # increment month
end

p sunday_count # => 171
