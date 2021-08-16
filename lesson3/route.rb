class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = {}
    @stations[first_station.name] = first_station
    @stations[last_station.name] = last_station
  end

  def add_station(station)
    self.stations[station.name] = station
    puts "К маршруту #{self} добавлена станция #{station}"
  end

  def delete_station(station)
    self.stations.delete(station.name)
    puts "Из маршрута #{self} удалена станция #{station}"
  end

end
