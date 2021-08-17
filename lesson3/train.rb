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
  end

  def stop
    self.speed = 0
  end

  def route=(route)
    @route = route
    self.station = self.route.stations.values.first
    self.station.get_train(self)
  end

  def add_wagon(wagon)
    self.wagons[wagon.number] = wagon
  end

  def delete_wagon (wagon)
    self.wagons.delete(wagon.number)
  end

  def move_next_station
    return unless next_station
    self.station.send_train(self)
    self.station = next_station
    self.station.get_train(self)
  end

  def move_previous_station
    return unless previous_station
    self.station.send_train(self)
    self.station = previous_station
    self.station.get_train(self)
  end

  def station_last
    if self.station.name != self.route.stations.values.last.name
      true
    else
      puts "Поезд находится на конечной станции #{self.route.stations.values.last.name}"
    end
  end

  def station_first
    if self.station.name != self.route.stations.values.first.name
      true
    else
      puts "Поезд находится на станции отправления #{self.route.stations.values.first.name}"
    end
  end

  def next_station
    return unless station_last
    self.route.stations.values[self.route.stations.values.index(self.station) + 1]
  end

  def previous_station
    return unless station_first
    self.route.stations.values[self.route.stations.values.index(self.station) - 1]
  end

end
