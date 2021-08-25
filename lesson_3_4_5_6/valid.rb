module Validate
  protected
  NAME_FORMAT = /^([а-яa-z]|\d)+$/i

  def validate_name!(name_object)
    raise "Название не может быть пустым" if name_object !~ NAME_FORMAT
    true
  end

  def validate_name?(name_object)
    validate_name!(name_object)
  rescue
    false
  end

end 

module ValidateType
  protected
  TRAIN_TYPE = ["Cargo","Passenger"]
  WAGON_TYPE = ["Cargo","Passenger"]

  def validate_train_type!(type)
    raise "Нельзя добавить поезда с типом #{type} используйте #{TRAIN_TYPE} в качестве типа поезда" if TRAIN_TYPE.include?(type) == false
    true
  end

  def validate_wagon_type!(type)
    raise "Нельзя добавить вагон с типом #{type} используйте #{WAGON_TYPE} в качестве типа вагона" if WAGON_TYPE.include?(type) == false
    true
  end

  def validate_train_type?(type)
    validate_train_type!(type)
  rescue
    false
  end

 def validate_wagon_type?(type)
    validate_wagon_type!(type)
  rescue
    false
  end

end

module ValidateStation
  protected
  def validate_count_station!
   raise "Создайте 2 или более станции перед тем как создавать маршрут" if Station.instances < 2
  end

  def validate_count_station?
    validate_count_station!
  rescue
    false
  end

end

module ValidateTrain
  protected
  NUMBER_TRAIN_FORMAT = /^([а-яa-z]|\d){3}-([а-яa-z]|\d){2}$/i

  def validate_train_number!(number)
    raise "Введен неправельный номер поезда #{number}" if number !~ NUMBER_TRAIN_FORMAT
    true
  end

  def validate_train_number?(number)
    validate_train_number!(number)
  rescue
    false
  end


end