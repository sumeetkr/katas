class HeapProblemsSolver

end

class Heap
  @internal_array_of_nodes

  def initialize
    @internal_array_of_nodes = []
  end

  def insert(node)
    #inserts at the last cell and than rebalances the heap
    @internal_array_of_nodes << node
    child_index = @internal_array_of_nodes.length - 1

    bubble_up(child_index)
  end

  def find()
    return @internal_array_of_nodes[0]
  end

  def get()
    min_node = @internal_array_of_nodes[0]

    last_index = @internal_array_of_nodes.length - 1
    @internal_array_of_nodes[0] = @internal_array_of_nodes[last_index]
    @internal_array_of_nodes.delete_at(last_index)

    settle_down()

    return min_node
  end

  def count
    return @internal_array_of_nodes.length
  end

  def is_heap()
    # check if for all nodes, the parent node is less than the child nodes
    is_heap_property_satisfied = true
    count = @internal_array_of_nodes.length - 1
    for current_index in count..1
      if (@internal_array_of_nodes[current_index] < @internal_array_of_nodes[(current_index -1)/ 2])
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

      if (@internal_array_of_nodes[child_index].key < @internal_array_of_nodes[parent_index].key)
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
      min_child_index = @internal_array_of_nodes[first_child_index].key < @internal_array_of_nodes[second_child_index].key ? first_child_index : second_child_index
      #if min child is more than parent, then swap
      if (@internal_array_of_nodes[min_child_index].key < @internal_array_of_nodes[parent_index].key)
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