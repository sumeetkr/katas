class WaterInBucket
  # To change this template use File | Settings | File Templates.
  #Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate
  #(i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
  # Find two lines, which together with x-axis forms a container,
  #such that the container contains the most water.

  def self.get_bucket_with_max_water(array)

    return consider_next_wall_in_max_bucket(array, 0, 0, 0)
  end

  def self.consider_next_wall_in_max_bucket(array, start, close, wall_index)

    if (wall_index == array.length)
      return start, close
    end

    #existing bucket
    bucket_height = array[start]<= array[close] ? array[start] : array[close]
    current_size = bucket_height * (close - start)

    #consider next wall
    if get_bucket_size(array, start, wall_index) > current_size
      close = wall_index
    end

    if get_bucket_size(array, close, wall_index) > current_size
      start = close
      close = wall_index
    end

    return consider_next_wall_in_max_bucket(array, start, close, wall_index + 1)
  end

  def self.get_bucket_size(array, start, close)
    bucket_height = array[start]<= array[close] ? array[start] : array[close]
    return bucket_height * (close - start)
  end
end