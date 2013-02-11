class PlatesStacking
  #  You are given a set of n types of rectangular 2-D plates, where the i^th plate has height h(i)
  #and width w(i) (all real numbers). You want to create a stack of plates which is as tall as
  #possible, but you can only stack a plate on top of another plate if the dimensions of the 2-D base
  #of the lower plate are each strictly larger than those of the 2-D base of the higher plate. Of course,
  #you can rotate a plate so that any side functions as its base.

  def count_stacked_plates(plates)

  end

end

class Plate
  attr_accessor :width
  attr_accessor :length

  def initialize (height, width)
    @width = width
    @width = height
  end
end