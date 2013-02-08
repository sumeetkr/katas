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
      array<<node.get_value()
      node = node.next
    end

    return array

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

  def get_value
    return @value
  end
end