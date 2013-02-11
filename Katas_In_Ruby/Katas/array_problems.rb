class ArrayProblems
  # To change this template use File | Settings | File Templates.
  #Given an array of integers, write a method to find indices m and n such that
  #if you sorted elements m through n, the entire array would be sorted.
  # Minimize n - m (that is, find the smallest such sequence).

  def get_closest_indices_to_sort(array)

    start_index = 0
    end_index = array.length -1


    while start_index < array.length && array[start_index]< array[start_index+1]
      start_index +=1
    end

    while  (end_index > 0 && array[end_index-1]< array[end_index]) && (array[end_index] > array[start_index])
      end_index -=1
    end

    return start_index, end_index

  end


  def self.get_max_element_of_unimodal_array(array)

    #  Problem description
    #  You are a given a unimodal array of n distinct elements,
    #  meaning that its entries are in increasing order up until its maximum element,
    #  after which its elements are in decreasing order. Give an algorithm to compute
    #  the maximum element that runs in O(log n) time.

    current_index = (array.length - 1)/2
    last_left_index = 0
    last_right_index = array.length - 1
    slope = 1
    last_slope = 1

    #  if slope is negative, traverse in left direction, else move right
    #  in every step remove half of the array

    until slope ==0

      if (slope > 0)
        last_left_index = current_index
        current_index = (current_index + last_right_index)/2
      else
        last_right_index = index
        current_index = (current_index + last_left_index)/2
      end

      last_slope = slope
      slope = get_slope(array, current_index)
    end

    return array[current_index]
  end

  def self.get_slope(array, index)
    #return -1 (negative), 1 (positive), 0
    mid = array[index]
    left = array[index -1]
    right = array[index +1]

    if (left < mid && mid < right)
      return 1
    else
      if (left > mid && mid > right)
        return 1
      else
        return 0
      end
    end
  end

end