class Wagon
  include Vendor
  include Validate


  attr_reader :wagon_type, :number

  def initialize(number)
    validate_name!(number)
    @number = number
  end

end
