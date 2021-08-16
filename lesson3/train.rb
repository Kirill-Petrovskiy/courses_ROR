class Train
  attr_reader :number, :train_type, :route, :wagons
  attr_accessor :station, :speed

  def initialize(number)
    @number = number
    @wagons = {}
    @speed = 0
  end

  def raise_speed(speed)
    self.speed += speed
    puts "Скорость поезда изменилась до #{speed}"
  end

  def stop
    self.speed = 0
    puts "Поезд остановился"
  end

  def route=(route)
     @route = route
     self.station = self.route.stations.values.first
     self.station.get_train(self)
     puts "Поезду задан маршрут #{route}"
     puts "Поезд прибыл на начальную станцию маршрута #{self.station}"
  end

  def next_station
    if self.station != self.route.stations.values.last
      self.route.stations.values[self.route.stations.values.index(self.station) + 1]
    else
      puts "Поезд находится на конечной станции #{self.station.name}"
    end
  end

  def previous_station
    if self.station != self.route.stations.values.first
      self.route.stations.values[self.route.stations.values.index(self.station) - 1]
    else
      puts "Поезд находится на станции отправления #{self.station.name}"
    end
  end

  def move_next_station
    return unless next_station
    self.station.send_train(self)
    self.station = next_station
    self.station.get_train(self)
    puts "Поезд прибыл на станцию #{self.station.name}"
  end

  def move_previous_station
    return unless previous_station
     self.station.send_train(self)
     self.station = previous_station
     self.station.get_train(self)
     puts "Поезд прибыл на станцию #{self.station.name}"
  end

  def add_wagon(wagon)
    if train_stopped? && type_match?(wagon)
      self.wagons[wagon.number] = wagon
      puts "К поезду добавлен вагон #{wagon}"
    end
  end

  def delete_wagon (wagon)
    if train_stopped? && wagon_in_train?(wagon)
      self.wagons.delete(wagon.number)
      puts "От поезда отцеплен вагон #{wagon}"
    end
  end

  protected #ниже методы которые нужны для корректной работы добавления и удаления поезда(тесты) пользователю не нужны
  #protected а не private потому что хотим чтобы они наследовались
  def train_stopped? #Проверяем остановлен ли поезд у пользователя есть метод speed чтобы узнать скорость в интерфейсе не предусмотрен
    if self.speed.zero?
      true
    else
      puts "Сначала требуется остановить поезд"
    end
  end

  def type_match?(wagon)#Проверяем совпадает ли тип вагона с поездом в интерфейсе не предусмотрен
    if wagon.wagon_type == self.train_type
      true
    else
      puts "Поезд может работать только с #{self.train_type} вагонами"
    end
  end

  def wagon_in_train?(wagon)#Проверяем есть ли такой вагон в составе поезда в интерфейсе не предусмотрен
    if self.wagons.include?(wagon.number) && type_match?(wagon)
      true
    else
      puts "В поезде нет данного вагона"
    end
  end

end
