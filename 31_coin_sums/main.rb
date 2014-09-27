# coins = [1,2,5,10,20,50,100,200]

count = 0
200.step(0,-200).each do |a|
  a.step(0, -100).each do |b|
    b.step(0, -50).each do |c|
      c.step(0, -20).each do |d|
        d.step(0, -10).each do |e|
          e.step(0, -5).each do |f|
            f.step(0, -2).each do |g|
              count += 1
            end
          end
        end
      end
    end
  end
end
puts "count: #{count}"

