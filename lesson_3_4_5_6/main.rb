require_relative 'vendor'
require_relative 'valid'
require_relative 'instance_counter'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'rail_road'

rail_road  = RailRoad.new
rail_road.start
