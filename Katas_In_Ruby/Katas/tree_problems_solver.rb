class TreeProblemsSolver

  def self.find_lowest_common_ancestor(tree, first_node, second_node)

  end

end

class Tree
  attr_accessor :root

  def self.insert(root, value)

  end

  def self.delete (root, value)

  end

  def find_min()

  end

  def find_max()

  end

  def find_predecessor_of_node(node)

  end

  def find_successor_of_a_node(node)

  end

  def get_keys_in_order_traversal(root_node)
    #  print keys in increasing order
  end

  def delete_node(root_node, node_to_be_deleted)

  end

  def find_rank_of_node(root_node, node)

  end

  def find_ith_order_statistic(root_node)

  end


end

class Node
  attr_accessor :left_node, :right_node, :value

  def initialize(value, left_node, right_node)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end

end