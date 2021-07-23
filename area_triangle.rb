puts "Введите длину основания треугольника"
base_triangle = gets.chomp.to_i
puts "Введите длину высоты треугольника"
height_triangle = gets.chomp.to_i
area_triangle = 1.0/2 * base_triangle * height_triangle
puts "Площадь треугольника #{area_triangle}"
