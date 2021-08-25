class Station
  include InstanceCounter
  include Valid

  attr_reader :name, :trains

   @@all_stations = {}

  def self.all
    @@all_stations
  end

  def initialize(name)
    validate_name!(name)
    @name = name
    @trains = {}
    @@all_stations[name] = self
    register_instance
  end

  def trains_by_type(type)
    trains_by_type = {}

    self.trains.each_key do |key|
      if self.trains[key].train_type == type
        trains_by_type[key] = self.trains[key]
      end
    end
  end

  def get_train(train)
    self.trains[train.number] = train
  end

  def send_train(train)
    self.trains.delete(train.number)
  end

end
