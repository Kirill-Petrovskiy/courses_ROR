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
     self.station.get_train(self)
  end

   def next_station
     if self.station != self.route.stations.last
       self.route.stations[self.route.stations.index(self.station) + 1]
     else
       puts "Поезд находится на конечной станции #{self.station.name}"
     end
   end

   def previous_station
     if self.station != self.route.stations.first
       self.route.stations[self.route.stations.index(self.station) - 1]
     else
       puts "Поезд находится на станции отправления #{self.station.name}"
     end
   end

   def move_next_station
     if self.station != self.route.stations.last
       self.station.send_train(self)
       self.station = self.route.stations[self.route.stations.index(self.station) + 1]
       self.station.get_train(self)
     else
       puts "Поезд уже прибыл на конечную станцию #{self.station.name}"
     end
   end

   def move_previous_station
     if self.station != self.route.stations.last
       self.station.send_train(self)
       self.station = self.route.stations[self.route.stations.index(self.station) - 1]
       self.station.get_train(self)
     else
       puts "Поезд уже прибыл на станцию отправления #{self.station.name}"
     end
   end
 end
