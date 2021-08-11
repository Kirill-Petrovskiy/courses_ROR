class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = []
    @stations << first_station
    @stations << last_station
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def delete_station(station)
    self.stations.delete(station)
  end

end
