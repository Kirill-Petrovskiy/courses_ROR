puts "Введите номер года"
year = gets.chomp.to_i
puts "Введите номер месяца"
month = gets.chomp.to_i
puts "Введите номер дня в месяце"
day = gets.chomp.to_i
serial_number = day
day_month = [31,28,31,30,31,30,31,31,30,31,30,31]

for step in 0..month - 2
  serial_number += day_month[step]
end

if month > 2 && year % 400 == 0 && year % 100 == 0 || month > 2 && year % 4 == 0
  serial_number += 1
end

puts "Порядковый номер даты #{serial_number}"
