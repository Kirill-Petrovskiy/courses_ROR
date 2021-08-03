class Train
  attr_reader :number, :type, :route
  attr_accessor :station, :speed, :count

  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
    @speed = 0
  end

  def raise_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage
    if self.speed == 0
      self.count += 1
    else
      puts "Сначала требуется остановить поезд"
    end
  end

  def delete_carriage
    if self.speed == 0
      self.count -= 1
    else
      puts "Сначала требуется остановить поезд"
    end
  end

  def route=(route)
     @route = route
     self.station = self.route.stations.first
   end

   def next_station
     self.route.stations[self.route.stations.index(self.station) + 1]
   end

   def previous_station
     self.route.stations[self.route.stations.index(self.station) - 1]
   end

   def move_next_station
     self.station = self.route.stations[self.route.stations.index(self.station) + 1]
   end

   def move_previous_station
     self.station = self.route.stations[self.route.stations.index(self.station) - 1]
   end
 end
