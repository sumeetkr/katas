require "../Katas/helpers"

class QuickSort

  def self.sort(array)
    #sort_recursivly(array, 0, array.length - 1)

    partition(array, 0, array.height - 1)

    return array

  end

  def self.total_number_of_comparisons_in_sorting_from_file(file_path)
    array = Helpers.populate_array_with_file_content(file_path)
    return partition(array, 0, array.length - 1)
  end

  def self.total_number_of_comparisons_in_sorting(array)


  end

  def self.partition(array, start_index, end_index)

    number_of_comparisons = 0
    if (start_index >= end_index)
      return number_of_comparisons
    end

    pivot_index = select_pivot(array, start_index, end_index)
    pivot = array[pivot_index]

    #if pivot is not first element, swap it with first element
    if (pivot_index != start_index)
      tmp = array[start_index]
      array[pivot_index] = tmp
      array[start_index] = pivot
      pivot_index = start_index

    end


    current_index = start_index + 1
    boundary_index = start_index + 1

    number_of_comparisons = end_index - start_index
    #assume 1st element is the pivot element
    while current_index < end_index + 1
      current = array[current_index]
      if (current < pivot)
        #  swap boundary element and current element
        array[current_index] = array[boundary_index]
        array[boundary_index] = current

        boundary_index += 1
      end

      current_index +=1
    end

    #  swap the pivot element with boundary element
    boundary_element = array[boundary_index - 1]
    array[boundary_index - 1] = pivot
    array[pivot_index] = boundary_element

    #  recurse
    number_of_comparisons += partition(array, start_index, boundary_index - 2)
    number_of_comparisons += partition(array, boundary_index, end_index)

    return number_of_comparisons
  end

  private;

  def self.select_pivot(array, start_index, end_index)
    #first strategy is to return the first element
    #return end_index
    #return (start_index + end_index)/2
    return median_of_three(array, start_index, end_index)
  end

  def self.median_of_three(array, start_index, end_index)
    #  Consider the first, middle, and final elements of the given array.
    # (If the array has odd length it should be clear what the "middle" element is;
    #for an array with even length 2k, use the kth element as the "middle" element.
    #So for the array 4 5 6 7, the "middle" element is the second one ---- 5 and not 6!)
    #Identify which of these three elements is the median (i.e., the one whose value is in between the other two),
    # and use this as your pivot.
    #  For the input array 8 2 4 5 7 1 you would consider the first (8), middle (4),
    #and last (1) elements; since 4 is the median of the set {1,4,8}, you would use 4 as your pivot element.

    size = end_index - start_index
    first = array[start_index]
    final = array[end_index]
    middle = array[(start_index + end_index) /2]

    arr = [first, middle, final].sort()
    case arr[1]
      when first
        return start_index

      when middle
        return (start_index + end_index) /2

      when final
        return end_index
    end
  end
end