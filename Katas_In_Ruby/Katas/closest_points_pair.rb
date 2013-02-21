class ShortestDistancePoints
  # To change this template use File | Settings | File Templates.
end

class Point
  attr_accessor :X, :Y

  def initialize(x, y)
    @X = x
    @Y = y
  end

  def distance(point)
    return Math.sqrt(((@X - point.X)*(@X - point.Y) + (@Y - point.Y)*(@Y - point.Y))/2)
  end
end