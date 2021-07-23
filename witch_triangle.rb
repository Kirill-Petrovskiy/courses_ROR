puts "Введите длину первой стороны триугольника"
one_side = gets.chomp.to_i
puts "Введите длину второй стороны триугольника"
two_side = gets.chomp.to_i
puts "Введите длину третьей стороны триугольника"
three_side = gets.chomp.to_i

a, b, h = [one_side, two_side, three_side].sort
if a == h
  puts "Равносторонний и равнобедренный треугольник"
    elsif a == b || b == h
    puts "Равнобедренный треугольник"
      elsif h**2 == a**2 + b**2
      puts "Прямоугольный треугольник"
        else
        puts "Разносторонний не прямоугольный треугольник"
end
