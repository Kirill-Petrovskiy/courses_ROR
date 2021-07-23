puts "Как тебя зовут?"
name = gets.chomp
puts "В каком году ты родился?"
year = gets.chomp

puts "Привет, #{name}! Ты родился #{year} году, тебе #{2021 - year.to_i} лет"


alex_height = 160
sem_height = 170
kirill_height = 171

if kirill_height > sem_height
  puts "Кирилл выше Сема"
end

#Таже запись с if

puts "Кирилл выше Сема" if kirill_height > sem_height

unless kirill_height < sem_height
  puts "Кирилл выше Сема"
end
#Таже запись с unless
puts "Кирилл выше Сема" unless kirill_height > sem_height

if kirill_height > sem_height
  puts "Кирилл выше Сема"
else
  puts "Сем выше Кирилла"
end


if kirill_height > sem_height
  puts "Кирилл выше Сема"
elsif kirill_height > alex_height
  puts "Кирилл выше Алекса"
else
  puts "Кирилл ниже всех"
end

if kirill_height > sem_height &&  kirill_height > alex_height
  puts "Кирилл ниже всех"
end
