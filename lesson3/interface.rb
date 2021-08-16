rail_road  = RailRoad.new

main_menu = { 1 => "Добавить новую станцию",
  2 => "Добавить новый поезд",
  3 => "Создать маршрут",
  4 => "Добавить станцию в маршрут",
  5 => "Удалить станцию из маршрута",
  6 => "Назначить маршрут поезду",
  7 => "Создать вагон",
  8 => "Добавить вагон к проезду",
  9 => "Отцепить вагон от поезда",
  10 => "Отправить поезд на следующую станцию",
  11 => "Отправить поезд на предыдущую станцию",
  12 => "Просмотреть поезда данного типа на выбранной станции",
  0 => "Завершить работу"}

loop do
  puts "Главное меню"
  puts "Введите номер для выбора действия или нажмите 0 дня выхода"

  user_inpute = rail_road.selection(main_menu)

  case user_inpute

  when "1"
    rail_road.create_station

  when "2"
    rail_road.create_train

  when "3"
    rail_road.create_route

  when "4"
    rail_road.add_station_in_route

  when "5"
    rail_road.delete_station_in_route

  when "6"
    rail_road.train_route

  when "7"
    rail_road.create_wagon

  when "8"
    rail_road.add_wagon_train

  when "9"
    rail_road.delete_wagon_train

  when "10"
    rail_road.train_move_next_station

  when "11"
    rail_road.train_move_previous_station

  when "12"
    rail_road.train_by_type_in_station

  when "0"
    break

  end
end
