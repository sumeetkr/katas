require "../Katas/dijkstra_shortest_path_finder"

class MinimumSpanningTreeSolver
#  Prism
#  Krusal
  attr_accessor :graph, :min_spanning_tree
  @boundary_edges

  def initialize(graph)
    @graph = graph
    @min_spanning_tree = Graph.new
    @boundary_edges = []
  end

  def expand(node)

    if(@min_spanning_tree.nodes_hash[node.number].nil?)
      @min_spanning_tree.nodes_hash[node.number] = node
    end


    min_edge = get_min_weight_edge(node)

    other_node_number = min_edge.get_other_node_number(node.number)
    other_node = @graph.nodes_hash[other_node_number]
    @min_spanning_tree.nodes_hash[other_node.number] = other_node


  end

  def get_min_weight_edge(node)
    min_edge_weight = 100000 #a big number
    min_edge = nil

    for edge in node.edges
      if (edge.weight < min_edge_weight)
        min_edge_weight = edge.weight
        min_edge = edge
      end
    end

    return min_edge
  end

end