class RailRoad
  attr_reader :all_station, :all_train, :all_route, :all_wagon, :type_1, :type_2

  def initialize
    @all_station = {}
    @all_train = {}
    @all_route = {}
    @all_wagon = {}
    @type_1 = "Cargo"
    @type_2 = "Passenger"
  end

  def selection(main_menu)
    main_menu.each {|key, value| puts "#{key} - #{value}"}
    puts "Выбран пункт:"
    gets.chomp
  end

  def create_station
    puts "Введите название создаваемой станции"
    name = gets.chomp
    all_station[name] =  Station.new(name)
    puts "Создана станция #{all_station[name]}"
  end

  def create_train
    puts "Введите номер поезда"
    number = gets.chomp
    puts "Введите тип поезда #{type_1} или #{type_2 }"
    type = gets.chomp

    if type == type_2
      all_train[number] = PassengerTrain.new(number)
      puts "Добавлен поезд#{all_train[number]}"
    elsif type == type_1
      all_train[number] = CargoTrain.new(number)
      puts "Добавлен поезд#{all_train[number]}"
    else
      puts "Нельзя добавить поезда с типом#{type} используйте #{type_1} или #{type_2 } в качестве типа поезда"
    end
  end

  def create_route
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
      all_route[name_route] = Route.new(first_station, last_station)
      puts"Создан маршрут #{all_route[name_route]}"
    else
      puts "Используйте существующие станции для создания маршрута или предварительно добавьте новые станции"
    end
  end

  def add_station_in_route
    puts "Введите название маршрута к которому хотите добавить станцию"
    name_route = gets.chomp

    if all_route.include?(name_route)
      puts "Введите название станции которую хотите добавить к маршруту #{all_route[name_route]}"
      name_station = gets.chomp

      if all_station.include?(name_station)
        all_route[name_route].add_station(all_station[name_station])
        puts "Станция #{all_station[name_station]} добавлена в маршрут #{all_route[name_route]}"
      else
        puts "Используйте существующие станции для добавления к маршрут или предварительно добавьте новые станции"
      end

    else
      puts "Вы вводите название несуществующего маршрута используйте существующие маршруты или предварительно добавьте новый маршрут"
    end
  end

  def delete_station_in_route
    puts "Введите название маршрута из которого хотите удалить станцию"
    name_route = gets.chomp

    if all_route.include?(name_route)
      puts "Введите название станции которую хотите удалить из маршрута #{all_route[name_route]}"
      name_station = gets.chomp

      if all_station.include?(name_station)
        all_route[name_route].delete_station(all_station[name_station])
        puts "Станция #{all_station[name_station]} удалена из маршрута #{all_route[name_route]}"
      else
        puts "Из маршрута можно удалить только существующие станции"
      end

    else
      puts "Вы вводите название несуществующего маршрута"
    end
  end

  def train_route
    puts "Введите название поезда которому хотите задать маршрут"
    name_train = gets.chomp

    if all_train.include?(name_train)
      puts "Введите название маршрута который хотите задать поезду #{all_train[name_train]}"
      name_route = gets.chomp

      if all_route.include?(name_route)
        all_train[name_train].route= all_route[name_route]
      else
        puts "Вы падетесь задать несуществующий маршрут используйте существующие маршруты или предварительно создайте их"
      end

    else
      puts "Такого поезда нет используйте существующие поезда или предварительно создайте его"
    end
  end

  def create_wagon
    puts "Введите номер вагона"
    number = gets.chomp
    puts "Введите тип вагона #{type_1} или #{type_2}"
    type = gets.chomp

    if type == type_2
      all_wagon[number] = PassengerWagon.new(number)
      puts "Добавлен вагон #{all_wagon[number]}"
    elsif type == type_1
      all_wagon[number] = CargoWagon.new(number)
      puts "Добавлен вагон#{all_wagon[number]}"
    else
      puts "Вы указали несуществующий тип вагона используйте #{type_1} или #{type_2}"
    end
  end

  def add_wagon_train
    puts "Введите номер поезда к которому хотите добавить вагон"
    number_train = gets.chomp

    if all_train.include?(number_train)
      puts "Введите номер вагона который хотите добавить к данному поезду"
      number_wagon = gets.chomp

      if all_wagon.include?(number_wagon)
        all_train[number_train].add_wagon(all_wagon[number_wagon])
      else
        puts "Такого вагона нет используйте существующие вагоны или предварительно создайте его"
      end

    else
      puts "Такого поезда нет используйте существующие поезда или предварительно создайте его"
    end
  end

  def delete_wagon_train
    puts"Введите номер поезда у которого хотите удалить вагон"
    number_train = gets.chomp

    if all_train.include?(number_train)
      puts"Введите номер вагона который хотите удалить у данного поезда"
      number_wagon = gets.chomp

      if all_wagon.include?(number_wagon)
        all_train[number_train].delete_wagon(all_wagon[number_wagon])
      else
        puts"Такого вагона нет можно отцепить только существующие вагоны"
      end

    else
      puts"Такого поезда нет используйте существующие поезда или предварительно создайте его"
    end
  end

  def train_move_next_station
    puts"Введите номер поезда который хотите отправить на следующую станцию"
    number_train = gets.chomp

    if all_train.include?(number_train)
      all_train[number_train].move_next_station
    else
      puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
    end
  end

  def train_move_previous_station
    puts"Введите номер поезда который хотите отправить на пердыдущую станцию"
    number_train = gets.chomp

    if all_train.include?(number_train)
      all_train[number_train].move_previous_station
    else
      puts"Такого поезда нет используйте существующие поезда или предварительно создайте его используя train"
    end
  end

  def train_by_type_in_station
    puts"Введите название станции на которой хотите посмотреть поезда"
    name_station = gets.chomp

    if all_station.include?(name_station)
      puts"Введите тип поездов которые хотите посмотреть #{type_1} или #{type_2}"
      type = gets.chomp

      if type != type_2 || type_1
        all_station[name_station].trains_by_type(type)
      else
        puts "Вы указали несуществующий тип поезда используйте #{type_1} или #{type_2}"
      end

    else
      puts "Такой станции нет используйте существующие стацнии или предварительно создайте их"
    end
  end
end
