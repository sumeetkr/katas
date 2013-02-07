require "../Katas/merge_sort"

class InversionsInArray

  def read_file(path)

  end

  def self.populate_array_with_file_content(file_path)

    array = Array.new

    File.open(file_path).each do |line|
      array << line.to_i
    end

    return array
  end

  def self.count_inversions(array)
    return MergeSort.count_inversions_while_sorting(array)
  end
end