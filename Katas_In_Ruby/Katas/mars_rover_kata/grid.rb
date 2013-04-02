class Grid
  attr_reader :height, :width

  def initialize(height, width)
    @height = height
    @width = width
    @obstacles = Array.new(width) { Array.new(height, false) }
  end

  def has_obstacles(x, y)
    return @obstacles[x][y]
  end

  def add_obstacles(x, y)
    @obstacles[x][y] = true
  end

  def next_x(current_x, current_y)
    x = (current_x += 1) % @width
    check_for_obstacles(current_x, current_y)
    return x
  end

  def last_x(current_x, current_y)
    x = (current_x -= 1) % @width
    check_for_obstacles(current_x, current_y)
    return x
  end

  def next_y(current_x, current_y)
    y = (current_y += 1) % @height
    check_for_obstacles(current_x, current_y)
    return y
  end

  def last_y(current_x, current_y)
    y = (current_y -= 1) % @height
    check_for_obstacles(current_x, current_y)
    return y
  end

  def check_for_obstacles(x, y)
    if has_obstacles(x, y)
      #throw "Grid cannot move on obstacle"
    end
  end

  private;
  @obstacles
end
