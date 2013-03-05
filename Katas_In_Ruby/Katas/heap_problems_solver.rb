class HeapProblemsSolver

  def self.find_median_of_an_array_of_nodes_in_ith_step(sequence_of_nodes)
    #  You are givien a sequence of numbers X1, X2, X3, ...., Xi one by one. At any time (or step i),
    # you need to return the median of {X1, X2, .... , Xi}.
    # Constraint: Your program should not take more than Log(i) time for i-th step.

    find_median_solver = FindMedianSolver.new
    last_median = nil

    for i in 0..(sequence_of_nodes.length - 1)
      last_median = find_median_solver.insert_new_node_and_return_median_node(sequence_of_nodes[i])

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
    #boundary case, first insert
    if (@min_heap.count == 0)
      @min_heap.insert(node)
      return node
    end

    median_node = nil

    if (node.key < @min_heap.find_root_node.key)
      @max_heap.insert(node)
      median_node = @max_heap.find_root_node
    else
      @min_heap.insert(node)
      median_node = @min_heap.find_root_node
    end


    # the two heaps should be of same size (or 1 size difference), to return median correctly
    if ((@min_heap.count - @max_heap.count).abs > 1)
      if (@min_heap.count > @max_heap.count)
        @max_heap.insert(@min_heap.get_root_node)

        median_node = @max_heap.find_root_node
      else
        @min_heap.insert(@max_heap.get_root_node)
        median_node = @min_heap.find_root_node
      end

    end

    return median_node
  end
end

class Heap
  @internal_array_of_nodes
  @is_min_heap

  def initialize(is_min_heap = true)
    @internal_array_of_nodes = []
    @is_min_heap = is_min_heap
  end

  def insert(node)
    #inserts at the last cell and than rebalances the heap
    @internal_array_of_nodes << node
    child_index = @internal_array_of_nodes.length - 1

    bubble_up(child_index)
  end

  def find_root_node()
    return @internal_array_of_nodes[0]
  end

  def get_root_node()
    min_node = @internal_array_of_nodes[0]

    last_index = @internal_array_of_nodes.length - 1
    @internal_array_of_nodes[0] = @internal_array_of_nodes[last_index]
    @internal_array_of_nodes.delete_at(last_index)

    settle_down()

    return min_node
  end

  def compare(first_node, second_node)
    if (@is_min_heap)
      return first_node.key < second_node.key
    else
      return first_node.key > second_node.key
    end

  end

  def count
    return @internal_array_of_nodes.length
  end

  def is_heap()
    # check if for all nodes, the parent node is less than the child nodes
    is_heap_property_satisfied = true
    count = @internal_array_of_nodes.length - 1
    for current_index in count..1
      if compare(@internal_array_of_nodes[current_index], @internal_array_of_nodes[(current_index -1)/ 2])
        is_heap_property_satisfied = false
      end
      current_index -= 1
    end

    return is_heap_property_satisfied
  end

  private;

  def bubble_up(child_index)
    while child_index > 0
      parent_index = (child_index-1)/2

      if compare(@internal_array_of_nodes[child_index], @internal_array_of_nodes[parent_index])
        #  swap parent and child nodes
        temp = @internal_array_of_nodes[child_index]
        @internal_array_of_nodes[child_index] = @internal_array_of_nodes[parent_index]
        @internal_array_of_nodes[parent_index] = temp
      end

      child_index = parent_index
    end
  end

  def settle_down()
    #settles the root node element at the right place in the heap
    parent_index = 0
    last_index = @internal_array_of_nodes.length - 1
    first_child_index = 2 * (parent_index +1) -1
    second_child_index = 2 * (parent_index +1)


    while first_child_index < last_index && second_child_index < last_index
      min_child_index = compare(@internal_array_of_nodes[first_child_index], @internal_array_of_nodes[second_child_index]) ? first_child_index : second_child_index
      #if min child is more than parent, then swap
      if compare(@internal_array_of_nodes[min_child_index], @internal_array_of_nodes[parent_index])
        #  swap parent and child nodes
        temp = @internal_array_of_nodes[min_child_index]
        @internal_array_of_nodes[min_child_index] = @internal_array_of_nodes[parent_index]
        @internal_array_of_nodes[parent_index] = temp
      end

      parent_index = min_child_index
      first_child_index = 2 * (parent_index +1) -1
      second_child_index = 2 * (parent_index +1)

    end

  end

end

class Node
  attr_accessor :key, :value

  def initialize(key, value = nil)
    @key = key
    @value = nil
  end

end