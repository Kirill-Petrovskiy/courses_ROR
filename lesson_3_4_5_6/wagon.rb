class Wagon
  include Vendor

  attr_reader :wagon_type, :number

  def initialize(number)
    @number = number
  end

end