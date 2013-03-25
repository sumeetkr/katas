require 'set'

class MaxWeightIndependentSetFinder

  def self.build_graph(path)

  end

  def self.build_sample_graph()
    graph = MIS_Graph.new()

    graph.add_node(1, 1)
    graph.add_node(2, 4)
    graph.add_node(3, 5)
    graph.add_node(4, 4)
    graph.add_node(5, 5)

    graph.create_edge(1, 2)
    graph.create_edge(2, 1)
    graph.create_edge(2, 3)
    graph.create_edge(3, 2)
    graph.create_edge(3, 4)
    graph.create_edge(4, 3)

    return graph
  end

  def find(graph)
    @max_set = Set.new
    @graph = graph

    return find_set(graph.nodes_hash.count)

  end

  def find_set(i)
    #  base case
    if (i < 1)
      return 0
    end

    weight_if_i_th_is_in_solution = @graph.nodes_hash[i].weight + find_set(i - 2)
    weight_if_i_th_is_not_in_solution = find_set(i - 1)

    return weight_if_i_th_is_in_solution > weight_if_i_th_is_not_in_solution ? weight_if_i_th_is_in_solution : weight_if_i_th_is_not_in_solution
  end
end

class MIS_Graph
  attr_accessor :nodes_hash

  def initialize
    @nodes_hash = Hash.new
  end

  def add_node(node_number, weight)
    node = MIS_Node.new(node_number, weight)
    @nodes_hash[node.number] = node
  end

  def create_edge(first_node_number, second_node_number)

    first_node = find_or_add_node(first_node_number)
    second_node = find_or_add_node(second_node_number)

    first_node.add_edge(second_node_number)
    second_node.add_edge(first_node_number)
  end

  private;

  def find_or_add_node(node_number)
    node = @nodes_hash[node_number]

    if (node.nil?)
      node = MIS_Node.new(node_number, 0)
      @nodes_hash[node_number] = node
    end

    return node
  end

end

class MIS_Node
  attr_accessor :number, :weight, :neighbour_numbers

  def initialize(node_number, weight)
    @number = node_number
    @weight = weight
    @neighbour_numbers = []
  end

  def add_edge(neighbour_node_number)
    @neighbour_numbers << neighbour_node_number
  end
end