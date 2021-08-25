class RailRoad
  include Validate
  include ValidateType
  include ValidateStation
  include ValidateTrain

  attr_reader :all_station, :all_train, :all_route, :all_wagon, :type_1, :type_2

  def initialize
    @all_station = {}
    @all_train = {}
    @all_route = {}
    @all_wagon = {}
    @type_1 = "Cargo"
    @type_2 = "Passenger"
  end

  def start
    rail_road  = RailRoad.new

    main_menu = { 1 => "Добавить новую станцию",
      2 => "Добавить новый поезд",
      3 => "Создать маршрут",
      4 => "Добавить станцию в маршрут",
      5 => "Удалить станцию из маршрута",
      6 => "Назначить маршрут поезду",
      7 => "Создать вагон",
      8 => "Добавить вагон к проезду",
      9 => "Отцепить вагон от поезда",
      10 => "Отправить поезд на следующую станцию",
      11 => "Отправить поезд на предыдущую станцию",
      12 => "Просмотреть поезда данного типа на выбранной станции",
      0 => "Завершить работу"}

    loop do
      puts "Главное меню"
      puts "Введите номер для выбора действия или нажмите 0 для выхода"

      user_inpute = rail_road.selection(main_menu)

      case user_inpute

      when "1"
        rail_road.create_station

      when "2"
        rail_road.create_train

      when "3"
        rail_road.create_route

      when "4"
        rail_road.add_station_in_route

      when "5"
        rail_road.delete_station_in_route

      when "6"
        rail_road.train_route

      when "7"
        rail_road.create_wagon

      when "8"
        rail_road.add_wagon_train

      when "9"
        rail_road.delete_wagon_train

      when "10"
        rail_road.train_move_next_station

      when "11"
        rail_road.train_move_previous_station

      when "12"
        rail_road.train_by_type_in_station

      when "0"
        break

      end

    end

  end

  protected

  def selection(main_menu)
    main_menu.each {|key, value| puts "#{key} - #{value}"}
    puts "Выбран пункт:"
    gets.chomp
  end

  def create_station
    begin
      puts "Введите название создаваемой станции"
      name_station = gets.chomp
      validate_name!(name_station)
      all_station[name_station] =  Station.new(name_station)
      puts "Создана станция #{all_station[name_station]}"
    rescue StandardError => e
      puts e
    retry
    end 
  end

  def create_train
    begin
      puts "Введите номер поезда"
      number = gets.chomp
      validate_train_number!(number)
    rescue StandardError => e
      puts e
    retry
    end
     
    begin
      puts "Введите тип поезда #{type_1} или #{type_2 }"
      type = gets.chomp
      validate_train_type!(type)
    rescue StandardError => e
      puts e
    retry
    end

    if type == type_2
      all_train[number] = PassengerTrain.new(number)
      puts "Добавлен поезд #{all_train[number]}"
    elsif type == type_1
      all_train[number] = CargoTrain.new(number)
      puts "Добавлен поезд #{all_train[number]}"
    end
  end

  def create_route
    validate_count_station!
    begin 
      puts "Введите название маршрута"
      name_route = gets.chomp
      validate_name!(name_route)
    rescue StandardError => e
      puts e
    retry
    end

    begin
      puts "Введите станцию отправления"
      name_station = gets.chomp
      validate_name!(name_station)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_station_include_station(name_station)
    first_station = all_station[name_station]

    begin
      puts "Введите станцию назначения"
      name_station = gets.chomp
      validate_name!(name_station)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_station_include_station(name_station)
    last_station = all_station[name_station]


    all_route[name_route] = Route.new(first_station, last_station)
    puts"Создан маршрут #{all_route[name_route]}"

    rescue StandardError => e
      puts e
  end


  def add_station_in_route

    begin
      puts "Введите название маршрута к которому хотите добавить станцию"
      name_route = gets.chomp
      validate_name!(name_route)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_route_include_route(name_route)

    begin
      puts "Введите название станции которую хотите добавить к маршруту #{all_route[name_route]}"
      name_station = gets.chomp
      validate_name!(name_station)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_station_include_station(name_station)
    all_route[name_route].add_station(all_station[name_station])
    puts "Станция #{all_station[name_station]} добавлена в маршрут #{all_route[name_route]}"

  end

  def delete_station_in_route
    begin
      puts "Введите название маршрута из которого хотите удалить станцию"
      name_route = gets.chomp
      validate_name!(name_route)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_route_include_route(name_route)

    begin
      puts "Введите название станции которую хотите удалить из маршрута #{all_route[name_route]}"
      name_station = gets.chomp
      validate_name!(name_station)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_station_include_station(name_station)
    all_route[name_route].delete_station(all_station[name_station])
    puts "Станция #{all_station[name_station]} удалена из маршрута #{all_route[name_route]}"
  end

  def train_route
    begin
      puts "Введите номер поезда которому хотите задать маршрут"
      number_train = gets.chomp
      validate_train_number!(number_train)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_train_include_train(number_train)

    begin
      puts "Введите название маршрута который хотите задать поезду #{all_train[number_train]}"
      name_route = gets.chomp
      validate_name!(name_route)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_route_include_route(name_route)
    all_train[number_train].route = all_route[name_route]
    puts "Поезду задан маршрут #{all_route[name_route]}"
    puts "Поезд прибыл на начальную станцию маршрута #{all_route[name_route].stations.values.first.name}"
  end

  def create_wagon
    begin
    puts "Введите номер вагона"
    number = gets.chomp
    validate_name!(number)
    rescue StandardError => e
      puts e
    retry
    end

    begin
      puts "Введите тип вагона #{type_1} или #{type_2}"
      type = gets.chomp
      validate_wagon_type!(type)
    rescue StandardError => e
      puts e
    retry
    end

    if type == type_2
      all_wagon[number] = PassengerWagon.new(number)
      puts "Добавлен вагон #{all_wagon[number]}"
    elsif type == type_1
      self.all_wagon[number] = CargoWagon.new(number)
      puts "Добавлен вагон#{self.all_wagon[number]}"
    end
  end

  def add_wagon_train
    begin
      puts "Введите номер поезда к которому хотите добавить вагон"
      number_train = gets.chomp
      validate_train_number!(number_train)
    rescue StandardError => e
      puts e
    retry
    end


    return unless all_train_include_train(number_train)

    begin
      puts "Введите номер вагона который хотите добавить к данному поезду"
      number_wagon = gets.chomp
      validate_name!(number_wagon)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_wagon_include_wagon(number_wagon)
    return unless type_match?(number_train, number_wagon)
    return unless train_stoped?(number_train)
    all_train[number_train].add_wagon(all_wagon[number_wagon])
    puts "К поезду добавлен вагон #{all_wagon[number_wagon]}"
  end

  def delete_wagon_train
    begin
      puts"Введите номер поезда у которого хотите удалить вагон"
      number_train = gets.chomp
      validate_train_number!(number_train)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_train_include_train(number_train)

    begin
      puts"Введите номер вагона который хотите удалить у данного поезда"
      number_wagon = gets.chomp
      validate_name!(number_wagon)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_wagon_include_wagon(number_wagon)
    return unless type_match?(number_train, number_wagon)
    return unless train_stoped?(number_train)
    return unless wagon_in_train?(number_train, number_wagon)
    all_train[number_train].delete_wagon(all_wagon[number_wagon])
    puts "От поезда отцеплен вагон #{all_wagon[number_wagon]}"
  end

  def train_move_next_station

    begin
      puts"Введите номер поезда который хотите отправить на следующую станцию"
      number_train = gets.chomp
      validate_train_number!(number_train)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_train_include_train(number_train)
    return unless all_train[number_train].move_next_station
    puts "Поезд прибыл на следующую станцию - #{all_train[number_train].station.name}"
  end

  def train_move_previous_station

    begin
      puts"Введите номер поезда который хотите отправить на пердыдущую станцию"
      number_train = gets.chomp
      validate_train_number!(number_train)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_train_include_train(number_train)
    return unless all_train[number_train].move_previous_station
    puts "Поезд прибыл на предыдущую станцию - #{all_train[number_train].station.name}"
  end

  def train_by_type_in_station
    begin
      puts "Введите название станции на которой хотите посмотреть поезда"
      name_station = gets.chomp
      validate_name!(name_station)
    rescue StandardError => e
      puts e
    retry
    end

    return unless all_station_include_station(name_station)

    begin
      puts "Введите тип поездов которые хотите посмотреть #{type_1} или #{type_2}"
      type = gets.chomp
      validate_train_type!(type)
    rescue StandardError => e
      puts e
    retry
    end

    if type != type_2 || type_1
      all_station[name_station].trains_by_type(type)
      puts "Поезда типа #{type} на станции #{self} #{trains_by_type}"
    else
        puts "Вы указали несуществующий тип поезда используйте #{type_1} или #{type_2}"
    end

  end

  def all_station_include_station(name_station)
    if all_station.include?(name_station)
      true
    else
      puts "Указана несуществующая станция #{name_station}"
    end
  end

  def all_route_include_route(name_route)
    if all_route.include?(name_route)
      true
    else
      puts "Вы вводите название несуществующего маршрута используйте существующие маршруты или предварительно добавьте новый маршрут"
    end
  end

  def all_wagon_include_wagon(number_wagon)
    if all_wagon.include?(number_wagon)
      true
    else
      puts "Такого вагона нет используйте существующие вагоны или предварительно создайте его"
    end
  end

  def all_train_include_train(number_train)
    if all_train.include?(number_train)
      true
    else
      puts "Такого поезда нет используйте существующие поезда или предварительно создайте его"
    end
  end

  def train_stoped?(number_train)
    if all_train[number_train].speed.zero?
      true
    else
      puts "Сначала требуется остановить поезд"
    end
  end

  def type_match?(number_train, number_wagon)
    if self.all_train[number_train].train_type == self.all_wagon[number_wagon].wagon_type
      true
    else
      puts "Поезд может работать только с #{self.all_train[number_train].train_type} вагонами"
    end
  end

  def wagon_in_train?(number_train, number_wagon)
    if all_train[number_train].wagons.include?(number_wagon)
      true
    else
      puts "В поезде нет данного вагона"
    end
  end

end
