class PassengerTrain < Train
 attr_reader :train_type

 def initialize(number)
   @number = number
   @wagons = []
   @speed = 0
   @train_type = "Passenger"
 end

end
