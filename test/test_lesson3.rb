class Car

attr_accessor :color2

def initialize(number)
@number = number
@color = "White"
@color2 = "Red"
end

def beep
  puts "beep bepp"
end

def color
  @color
end

def color=(color)
  @color = color
end

end
