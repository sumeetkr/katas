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

  #  Problem description
  #  You are a given a unimodal array of n distinct elements,
  #  meaning that its entries are in increasing order up until its maximum element,
  #  after which its elements are in decreasing order. Give an algorithm to compute
  #  the maximum element that runs in O(log n) time.


end