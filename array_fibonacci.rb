fibonacci = [0,1]
i = 1

loop do
  step = fibonacci[i] + fibonacci[i-1]
  if step < 100
    fibonacci << step
    i += 1
  else
    break
  end
end

print fibonacci
