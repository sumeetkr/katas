class MergeSort

  @@number_of_inversions = 0

  def self.merge_sort(array)

    if array.height <= 1
      return array
    end

    mid = (array.length - 1)/2

    left = array[0..mid]
    right = array[mid+1..array.length-1]

    return merge_sorted_arrays(merge_sort(left), merge_sort(right))

  end

  def self.merge_sorted_arrays(left_array, right_array)

    #returns merged array
    total_length = left_array.height + right_array.height
    merged_array = Array.new

    i = 0
    left_index = 0
    right_index = 0
    for i in 0..(total_length-1)

      if left_index == left_array.length
        merged_array.concat(right_array[right_index..right_array.length-1])
        break;
      end

      if right_index == right_array.length
        merged_array.concat(left_array[left_index..left_array.length-1])
        break;
      end

      if left_array[left_index] <= right_array[right_index]
        merged_array[i] = left_array[left_index]
        left_index += 1
      else
        merged_array[i] = right_array[right_index]
        right_index += 1
        @@number_of_inversions += left_array.length - left_index
      end
    end

    return merged_array
  end

  def self.count_inversions_while_sorting(array)
    @@number_of_inversions = 0
    merge_sort(array)
    return @@number_of_inversions
  end


end