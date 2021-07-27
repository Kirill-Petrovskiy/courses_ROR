shopping = Hash.new
full_price = Hash.new
total_price = 0
puts "Введите \"стоп\" для заверщения ввода информации о покупках"

loop do
  puts "Введите название товара"
  name = gets.chomp.downcase
  break if name == "стоп"
  puts "Введите стоимость товара"
  price = gets.chomp.to_f
  puts "Введите количество товара"
  count = gets.chomp.to_f
  shopping[name.to_sym] = {price: price, count: count}
  full_price[name.to_sym] = price * count
  total_price += (price * count)
end

puts "Список покупок #{shopping}"
puts "Итоговая сумма за товар #{full_price}"
puts "Итоговая сумма покупок #{total_price}"
