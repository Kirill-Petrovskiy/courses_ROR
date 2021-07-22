puts "Введите коэффициент a"
a = gets.chomp.to_i
puts "Введите коэффициент b"
b = gets.chomp.to_i
puts "Введите коэффициент c"
c = gets.chomp.to_i

d = b ** 2 - 4 * a * c
if d > 0
c = Math.sqrt(d)
x1 = (-b + c) / (2 * a)
x2 = (-b - c) / (2 * a)
puts "x1 = #{x1} x2 = #{x2}"
elsif d < 0
puts "Корней уравнения нет"
else
x1 = x2 = -b / (2 * a)
puts "x1 = #{x1} x2= #{x2}"
end
