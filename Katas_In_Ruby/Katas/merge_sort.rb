class MergeSort

  def self.merge_sort(array)

    if array.length==1
      return
    end

    mid = (array.length -1)/2

    left = array[0..mid]
    right = array[mid..array.length]

    return merge_sorted_arrays(merge_sort(left), merge_sort(right))

  end

  def self.merge_sorted_arrays(left_array, right_array)

    #returns merged array
    total_length=left_array.length+right_array.length
    merged_array =[total_length]

    left_index, right_index =0
    for i in 0..total_length-1

      if left_index == left_array.length
        merged_array << right_array[right_index..right_array.length-1]
        break;
      end

      if right_index == right_array.length
        merged_array << left_array[left_index..right_array.length-1]
        break;
      end

      if left_array[left_index] <= right_array[right_index]
        merged_array[i] = left_array[left_index]
        ++left_index
      else
        merged_array[i] = right_array[right_index]
        ++right_index
      end
    end

    return merged_array
  end


end