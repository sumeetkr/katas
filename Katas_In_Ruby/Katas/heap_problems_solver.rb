class HeapProblemsSolver

  def self.find_median_of_an_array_of_nodes_in_ith_step(sequence_of_nodes)
    #  You are givien a sequence of numbers X1, X2, X3, ...., Xi one by one. At any time (or step i),
    # you need to return the median of {X1, X2, .... , Xi}.
    # Constraint: Your program should not take more than Log(i) time for i-th step.

    find_median_solver = FindMedianSolver.new
    last_median = nil

    for i in 0..(sequence_of_nodes.height - 1)
      median = find_median_solver.insert_new_node_and_return_median_node(sequence_of_nodes[i])
      last_median = median #for debugging
    end

    return last_median
  end
end

class FindMedianSolver
  def initialize
    @min_heap = Heap.new()
    @max_heap = Heap.new(false)
  end

  def insert_new_node_and_return_median_node(node)
    check_if_both_heaps_are_almost_equal

    #boundary case, first insert
    if (@max_heap.count == 0)
      @max_heap.insert(node)
      return node
    end

    if (node.key < @max_heap.find_root_node.key)
      @max_heap.insert(node)
    else
      @min_heap.insert(node)
    end

    diff = @max_heap.count - @min_heap.count

    case diff
      when -2
        @max_heap.insert(@min_heap.get_root_node)
      when -1
        @max_heap.insert(@min_heap.get_root_node)
      when 2
        @min_heap.insert(@max_heap.get_root_node)
    end

    check_if_both_heaps_are_almost_equal

    median_node = @max_heap.find_root_node
    return median_node
  end

  def total_count
    return @max_heap.count + @min_heap.count
  end

  def check_if_both_heaps_are_almost_equal
    if ((@max_heap.count - @min_heap.count).abs > 1)
      raise "unbalanced heap"
    end
  end
end

class Heap
  attr_accessor :array_of_nodes
  attr_reader :is_min_heap

  def initialize(is_min_heap = true)
    @array_of_nodes = []
    @is_min_heap = is_min_heap
  end

  def insert(node)
    #inserts at the last cell and than rebalances the heap
    @array_of_nodes << node
    child_index = @array_of_nodes.length - 1

    bubble_up(child_index)
  end

  def find_root_node()
    return @array_of_nodes[0]
  end

  def get_root_node()
    min_node = @array_of_nodes[0]

    last_index = @array_of_nodes.length - 1
    @array_of_nodes[0] = @array_of_nodes[last_index]
    @array_of_nodes.delete_at(last_index)

    settle_down()

    return min_node
  end

  def compare(first_node, second_node)
    if (first_node.nil? || second_node.nil?)
      raise "bad input"
    end

    if (@is_min_heap)
      return first_node.key < second_node.key
    else
      return first_node.key > second_node.key
    end
  end

  def count
    return @array_of_nodes.length
  end

  def is_heap()
    #boundary case
    if (@array_of_nodes.length <= 1)
      return true
    end

    # check if for all nodes, the parent node is less than the child nodes
    is_heap_property_satisfied = true
    count = @array_of_nodes.length - 1

    for current_index in count..1
      if compare(@array_of_nodes[current_index], @array_of_nodes[(current_index -1)/ 2])
        is_heap_property_satisfied = false
        raise "bad heap"
      end
      current_index -= 1
    end

    return is_heap_property_satisfied
  end

  private;

  def bubble_up(child_index)
    while child_index > 0
      parent_index = (child_index-1)/2

      if compare(@array_of_nodes[child_index], @array_of_nodes[parent_index])
        #  swap parent and child nodes
        temp = @array_of_nodes[child_index]
        @array_of_nodes[child_index] = @array_of_nodes[parent_index]
        @array_of_nodes[parent_index] = temp
      end

      child_index = parent_index
    end

    check_is_heap_property_maintained

  end

  def settle_down()
    #settles the root node element at the right place in the heap
    parent_index = 0
    last_index = @array_of_nodes.length - 1
    first_child_index = 2 * (parent_index +1) -1
    second_child_index = 2 * (parent_index +1)


    while first_child_index <= last_index && second_child_index <= last_index + 1

      if second_child_index > last_index
        #  compare parent and first child only
        if compare(@array_of_nodes[first_child_index], @array_of_nodes[parent_index])
          swap_paent_with_child(first_child_index, parent_index)
        end

        parent_index = first_child_index
        first_child_index = 2 * (parent_index +1) -1
        second_child_index = 2 * (parent_index +1)

      else
        min_child_index = compare(@array_of_nodes[first_child_index], @array_of_nodes[second_child_index]) ? first_child_index : second_child_index
        #if min child is more than parent, then swap
        if compare(@array_of_nodes[min_child_index], @array_of_nodes[parent_index])
          #  swap parent and child nodes
          swap_paent_with_child(min_child_index, parent_index)
        end

        parent_index = min_child_index
        first_child_index = 2 * (parent_index +1) -1
        second_child_index = 2 * (parent_index +1)
      end

    end

    check_is_heap_property_maintained

  end

  def swap_paent_with_child(child_index, parent_index)
    temp = @array_of_nodes[child_index]
    @array_of_nodes[child_index] = @array_of_nodes[parent_index]
    @array_of_nodes[parent_index] = temp
  end

  def check_is_heap_property_maintained
    if (!is_heap)
      raise "bad heap"
    end
  end

end

class HeapNode
  attr_accessor :key, :value

  def initialize(key, value = nil)
    @key = key
    @value = nil
  end

end