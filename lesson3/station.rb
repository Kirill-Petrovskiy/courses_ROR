class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  def trains_by_type(type)
    trains_by_type = []
    self.trains.each do |train|
      if train.type == type
        train_by_type << train
      end
    end
  end
end
