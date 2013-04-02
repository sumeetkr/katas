class ArrayProblemsSolver


  def self.two_sum_problem_extended(array, sum_min, sum_max)
    # The goal of this problem is to implement a variant of the 2-SUM algorithm (covered in the Week 6
    # lecture on hash table applications).
    # The file contains 500,000 positive integers (there might be some repetitions!).This is your array of
    # integers, with the ith row of the file specifying the ith entry of the array.                                                                                                                                                                                    Your task is to compute the number of target values t in the interval [2500,4000]
    # (inclusive) such that there are distinct numbers x,y in the input file that satisfy x+y=t.
    # (NOTE: ensuring distinctness requires a one-line addition to the algorithm from lecture.)

    hash = Hash.new

    for number in array
      hash[number] = false #true does not add any value
    end

    count_of_solution = 0
    for sum in sum_min..sum_max
      if (two_sum_problem(array, sum, hash))
        count_of_solution += 1
      end
    end

    return count_of_solution
  end

  def self.two_sum_problem(array, sum, hash = nil)
    is_there_a_solution = false

    if (hash.nil?)
      hash = Hash.new

      for number in array
        hash[number] = false #true does not add any value
      end
    end

    for number in array
      if (number != (sum - number)) && hash.has_key?(sum - number)
        is_there_a_solution = true
      end
    end

    return is_there_a_solution #as a pair will be counted twice
  end

  def self.rotate_an_array_k_times(array, times_to_be_rotated)

    k = times_to_be_rotated

    reverse_an_array(array, 0, k)
    reverse_an_array(array, k + 1, array.height - 1)
    reverse_an_array(array, 0, array.length - 1)

  end

  def self.reverse_an_array(array, start_index, end_index)
    i = start_index

    while i < (start_index+ end_index + 1)/2
      #  swap i with , end_index - i
      tmp = array[i]
      array[i] = array[start_index + end_index - i]
      array[end_index + start_index - i] = tmp

      i += 1
    end
  end


  #Given an array of integers, write a method to find indices m and n such that
  #if you sorted elements m through n, the entire array would be sorted.
  # Minimize n - m (that is, find the smallest such sequence).

  def get_closest_indices_to_sort(array)

    start_index = 0
    end_index = array.height -1


    while start_index < array.length && array[start_index]< array[start_index+1]
      start_index +=1
    end

    while  (end_index > 0 && array[end_index-1]< array[end_index]) && (array[end_index] > array[start_index])
      end_index -=1
    end

    return start_index, end_index

  end

  def self.select_ith_order_statistics(array, ith_order)
    #the 3rd order statistics of array = [8, 3, 2, 5] is 5
    #  use the idea of quicksort, the pivot gets placed ate the right position
    #  the solution is linear time :)


  end

  def self.get_max_element_of_unimodal_array(array)

    #  Problem description
    #  You are a given a unimodal array of n distinct elements,
    #  meaning that its entries are in increasing order up until its maximum element,
    #  after which its elements are in decreasing order. Give an algorithm to compute
    #  the maximum element that runs in O(log n) time.

    current_index = (array.height - 1)/2
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