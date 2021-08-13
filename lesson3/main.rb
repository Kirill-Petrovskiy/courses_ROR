require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

puts "Введите station чтобы добавить новую станцию"
puts "Введите train чтобы добавить новый поезд"
puts "Введите route чтобы создать маршрут"
puts "Введите add_station чтобы добавить станцию в маршрут"
puts "Введите delete_station чтобы удалить станцию из маршрута"
puts "Введите train_route чтобы назначить маршрут поезду"
puts "Введите add_wagon чтобы добавить вагон к проезду"
puts "Введите delete_wagon чтобы отцепить вагон от поезда"
puts "Введите move_next_station чтобы отправить поезд на следующую станцию"
puts "Введите move_previous_station чтобы отправить поезд на предыдущую станцию"
puts "Введите train_station чтобы просмотреть поезда данного типа на выбранной станции"
puts "Введите wagon чтобы создать вагон"
puts "Введите stop Чтобы завершить работу"

all_station = {}
all_train = {}
all_route = {}
all_wagon = {}

loop do

action = gets.chomp.downcase

case action

when "station"
  puts "Введите название создаваемой станции"
  name_station = gets.chomp
  station = Station.new(name_station)
  all_station[name_station] = station
  puts "Создана станция #{name_station}"

when "stop"
  break

when "train"
  puts "Введите номер поезда"
  number = gets.chomp
  puts "Введите тип поезда Cargo или Passenger"
  type = gets.chomp

  if type == "Passenger"
    train = PassengerTrain.new(number)
    all_train[number] = train
    puts "Добавлен поезд#{train}"
  elsif type == "Cargo"
    train = CargoTrain.new(number)
    all_train[number] = train
    puts "Добавлен поезд#{train}"
  else
    train = Train.new(number)
    all_train[number] = train
    puts "Добавлен поезд#{train}"
  end

when "route"
  puts "Введите название маршрута"
  name_route = gets.chomp
  puts "Введите станцию отправления"
  name_station = gets.chomp

  if all_station.include?(name_station)
    first_station = all_station[name_station]
    puts "Введите станцию назначения"
    name_station = gets.chomp

    if all_station.include?(name_station)
      last_station = all_station[name_station]
    else
      puts "Указана несуществующая станция #{name_station}"
    end

  else
    puts "Указана несуществующая станция #{name_station}"
  end

  if last_station != nil && first_station != nil
    route = Route.new(first_station, last_station)
    all_route[name_route] = route
    puts"Создан маршрут #{name_route}"
  else
    puts "Используйте существующие станции для создания маршрута или предварительно добавьте новые станции используя station"
  end

when "add_station"
  puts "Введите название маршрута к которому хотите добавить станцию"
  name_route = gets.chomp

  if all_route.include?(name_route)
    name_route = all_route[name_route]
    puts "Введите название станции которую хотите добавить к маршруту #{name_route}"
    name_station = gets.chomp

    if all_station.include?(name_station)
      name_station = all_station[name_station]
      all_route[name_route] = name_route.add_station(name_station)
      puts "Станция #{name_station} добавлена в маршрут #{name_route}"
      puts "#{all_route[name_route]}"
    else
      puts "Используйте существующие станции для добавления к маршрут или предварительно добавьте новые станции используя station "
    end

  else
    puts "Вы вводите название несуществующего маршрута используйте существующие маршруты или предварительно добавьте новый маршрут используя route "
  end

when "delete_station"
  puts "Введите название маршрута из которого хотите удалить станцию"
  name_route = gets.chomp

  if all_route.include?(name_route)
    name_route = all_route[name_route]
    puts "Введите название станции которую хотите удалить из маршрута #{name_route}"
    name_station = gets.chomp

    if all_station.include?(name_station)
      name_station = all_station[name_station]
      all_route[name_route] = name_route.delete_station(name_station)
      puts "Станция #{name_station} удалена из маршрута #{name_route}"
      puts "#{all_route[name_route]}"
    else
      puts "Из маршрута можно удалить только существующие станции "
    end

  else
    puts "Вы вводите название несуществующего маршрута"
  end

when "train_route"
  puts"Введите название поезда которому хотите задать маршрут"
  name_train = gets.chomp

  if all_train.include?(name_train)
    puts"Введите название маршрута который хотите задать поезду#{}"
    name_route = gets.chomp

    if all_route.include?(name_route)
      name_route = all_route[name_route]
      all_train[name_train].route(name_route)
    else
      puts"Вы падетесь задать несуществующий маршрут используйте существующие маршруты или предварительно создайте их используя route"
    end

  else
    puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
  end

when "wagon"
  puts"Введите номер вагона"
  number = gets.chomp
  puts"Введите тип вагона Cargo или Passenger"
  type = gets.chomp

  if type == "Passenger"
    wagon = PassengerWagon.new(number)
    all_wagon[number] = wagon
    puts "Добавлен вагон #{wagon}"
  elsif type == "Cargo"
    wagon = CargoWagon.new(number)
    all_wagon[number] = wagon
    puts "Добавлен вагон#{wagon}"
  else
    puts "Вы указали несуществующий тип вагона используйте Cargo или Passenger"
  end

when "add_wagon"
  puts"Введите номер поезда к которому хотите добавить вагон"
  number_train = gets.chomp

  if all_train.include?(number_train)
    puts"Введите номер вагона который хотите добавить к данному поезду"
    number_wagon = gets.chomp

    if all_wagon.include?(number_wagon)
      number_wagon = all_wagon[number_wagon]
      all_train[number_train].add_wagon(number_wagon)
    else
      puts"Такого вагона нет используйте существующие вагоны или предварительно создайте его используя wagon"
    end

  else
    puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
  end

when "delete_wagon"
  puts"Введите номер поезда у которого хотите удалить вагон"
  number_train = gets.chomp

  if all_train.include?(number_train)
    puts"Введите номер вагона который хотите удалить у данного поезда"
    number_wagon = gets.chomp
    if all_wagon.include?(number_wagon)
      number_wagon = all_wagon[number_wagon]
      all_train[number_train].delete_wagon(number_wagon)
    else
      puts"Такого вагона нет можно отцепить только существующие вагоны"
    end

  else
    puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
  end

when "move_next_station"
  puts"Введите номер поезда который хотите отправить на следующую станцию"
  number_train = gets.chomp

  if all_train.include?(number_train)
    train = all_train[number_train]
    train.move_next_station
  else
    puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
  end

when "move_previous_station"
  puts"Введите номер поезда который хотите отправить на пердыдущую станцию"
  number_train = gets.chomp

  if all_train.include?(number_train)
    train = all_train[number_train]
    train.move_previous_station
  else
    puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
  end

when "train_station"
  puts"Введите название станции на которой хотите посмотреть поезда"
  name_station = gets.chomp

  if all_station.include?(name_station)
    station = all_station[name_station]
    puts"Введите тип поездов которые хотите посмотреть Cargo или Passenger"
    type = gets.chomp

    if type != "Passenger" or "Cargo"
      station.trains_by_type(type)
    else
      puts "Вы указали несуществующий тип поезда используйте Cargo или Passenger"
    end

  else
    puts"Такой станции нет используйте существующие стацнии или предварительно создайте их используя station"
  end

end
end
