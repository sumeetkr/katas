class QuickSort

  def self.sort(array)
    sort_recursivly(array, 0, array.length - 1)
    return array

  end

  private;

  def self.sort_recursivly(array, start_index, end_index)
    if end_index <= start_index
      return
    end

    pivot_index = select_pivot(array, start_index, end_index)
    pivot = array[pivot_index]
    #
    i = start_index
    lesser_array_end = start_index
    until i == end_index + 1
      if i == end_index + 1
        #  swap pivot and last of lesser array element
        temp = array[lesser_array_end]
        array[lesser_array_end] = pivot
        array[pivot_index] = temp

        pivot_index = i
        break
      end

      if (i != pivot_index && array[i] < pivot)
        temp = array[lesser_array_end + 1]
        array[lesser_array_end + 1] = array[i]
        array[i] = temp

        lesser_array_end +=1
      end


      i += 1
    end

    sort_recursivly(array, start_index, pivot_index - 1)
    sort_recursivly(array, pivot_index + 1, end_index - 1)
  end

  def self.select_pivot(array, start_index, end_index)
    #first strategy is to return the first element
    return start_index
  end
end