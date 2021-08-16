require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'rail_road'
require_relative 'interface'



st1 = Station.new("st1")
st2 = Station.new("st2")
st3 = Station.new("st3")

rt1 = Route.new(st1, st2)
rt1.add_station(st3)

tr1 = CargoTrain.new("tr1")
tr1.route = rt1
tr1.speed = 0

wg1 = CargoWagon.new("wg1")
wg3 = CargoWagon.new("wg3")
wg2 = PassengerWagon.new("wg2")

tr1.add_wagon(wg1)

tr1.add_wagon(wg3)

tr1.delete_wagon(wg2)

tr1.add_wagon(wg2)

tr1.next_station
tr1.move_next_station
tr1.previous_station
tr1.move_previous_station

tr2 = CargoTrain.new("tr2")
st1.get_train(tr2)

st1.trains_by_type("Cargo")
