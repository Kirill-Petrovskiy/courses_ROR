puts "Введите длину основания треугольника"
base_triangle = gets.chomp
puts "Введите длину высоты треугольника"
height_triangle = gets.chomp
area_triangle = 1.0 / 2 * base_triangle.to_i * height_triangle.to_i
puts "Площадь треугольника #{area_triangle}"
