class TreeProblemsSolver

  def self.find_lowest_common_ancestor(tree, first_node, second_node)

  end

end

class BinaryTree
  attr_accessor :root

  def initialize(root_node_data)
    @root = Node.new(root_node_data)
  end

  def self.insert(root, value)
    root.insert(value)
  end

  def self.delete (root, value)

  end

  def find_min()

  end

  def find_max()

  end

  def self.find_predecessor_of_node(node)

  end

  def find_successor_of_a_node(node)

  end

  def self.get_keys_in_order_traversal(root_node)
    #  print keys in increasing order
    keys = []
    traverse_in_order(root_node, keys)
    return keys
  end

  def delete_node(root_node, node_to_be_deleted)

  end

  def find_rank_of_node(root_node, node)

  end

  def find_ith_order_statistic(root_node)

  end

  private;
  def self.traverse_in_order(node, keys)
    traverse_in_order(node.left_node, keys) unless node.left_node.nil?
    keys << node.value
    traverse_in_order(node.right_node, keys) unless node.right_node.nil?
  end

end

class Node
  attr_accessor :left_node, :right_node, :value

  def initialize(value, left_node = nil, right_node = nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end

  def insert(value)
    if(value > @value)
      if(@right_node.nil?)
        @right_node = Node.new(value)
      else
        @right_node.insert(value)
      end
    else
      if(@left_node.nil?)
        @left_node = Node.new(value)
      else
        @left_node.insert(value)
      end
    end
  end
end