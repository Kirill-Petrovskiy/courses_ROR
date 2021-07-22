puts "Как тебя зовут?"
your_name = gets.chomp
puts "Какой твой рост?"
your_height = gets.chomp
ideal_weight = (your_height.to_i - 100) * 1.15
puts "#{your_name}, твой идеальный вес #{ideal_weight} килограмм."
