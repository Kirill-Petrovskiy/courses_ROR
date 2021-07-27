array = Array.new
step = 10

loop do
  array << step
  break if step == 100
  step += 5
end

print array
