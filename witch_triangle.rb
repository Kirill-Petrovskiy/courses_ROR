puts "Введите длину первой стороны триугольника"
one_side = gets.chomp.to_i
puts "Введите длину второй стороны триугольника"
two_side = gets.chomp.to_i
puts "Введите длину третьей стороны триугольника"
three_side = gets.chomp.to_i

if one_side == two_side && one_side == three_side && two_side == three_side
puts "Равносторонний и равнобедренный треугольник"

elsif one_side == two_side  || one_side == three_side || two_side == three_side
puts "Равнобедренный треугольник"

elsif one_side > two_side && one_side > three_side
puts "Прямоугольный треугольник" if one_side ** 2 == two_side ** 2 + three_side ** 2

elsif two_side > one_side && two_side > three_side
puts "Прямоугольный треугольник" if two_side ** 2 == one_side ** 2 + three_side ** 2

elsif three_side > one_side && three_side > two_side
puts "Прямоугольный треугольник" if three_side ** 2 == two_side ** 2 + one_side ** 2

else
  puts "Разносторонний не прямоугольный треугольник"
end
