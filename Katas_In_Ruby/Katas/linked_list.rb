class LinkedList
  # To change this template use File | Settings | File Templates.

  def self.remove_duplicates(head)

    node = head
    lastNode = head
    last_value = head.value

    until node.nil?
      lastNode = node
      val = node.value


      node = node.next
    end

  end

  def self.traverse(head)

    array = Array.new

    node = head
    until node.nil?
      array << node.get_value()
      node = node.next
    end

    return array

  end

  def self.remove_n_from_last(head, n)

    current_node = head
    nth_previous_node = head
    count_of_traveresed = 0

    until current_node.nil?

      if (count_of_traveresed > n)
        nth_previous_node = nth_previous_node.next
      end

      count_of_traveresed += 1
      current_node =current_node.next
    end

    # drop the next node of nth_previous_node, and reconnect
    next_to_nth_previous_node = nth_previous_node.next
    next_to_next_to_nth_previous_node = next_to_nth_previous_node.next
    nth_previous_node.set_next(next_to_next_to_nth_previous_node)

    return head

  end

  def self.print_reverse(head)
    stack = []

    current_node = head
    while !current_node.nil?
      stack.push(current_node.get_value)
      current_node = current_node.next
    end

    list = []
    while !stack.empty?
      list << stack.pop()
    end

    return list
  end

  def self.print_reverse_recursive(head, list)
    return if head.nil?

    print_reverse_recursive(head.next, list)
    list << head.get_value
  end
end

class Node
  @value
  @next_list

  def initialize(value, next_list)
    @value = value
    @next_list = next_list
  end

  def next
    return @next_list
  end

  def set_next(node_to_be_next)
    @next_list = node_to_be_next
  end

  def get_value
    return @value
  end
#
end