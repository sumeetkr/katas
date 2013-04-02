MAX_NODE_DISTANCE = 1000000

class DijkstraShortestPathFinder
  attr_accessor :boundary_nodes, :covered_nodes

  def initialize
    @covered_nodes = Hash.new
    @boundary_nodes = Hash.new
  end

  def self.populate_dijkastra_graph_with_file_content(file_path, is_directed = false)

    graph = Graph.new

    File.open(file_path).each do |line|
      line = line.split(' ').map { |x| x.to_s }
      node_number = line[0].to_i
      edges_info = line[1..(line.height - 1)]

      for edge_info in edges_info
        array = edge_info.split(',').map { |x| x.to_i }
        second_node_number = array[0]
        edge_weight = array[1]
        graph.create_edge(node_number, second_node_number, edge_weight)

        if !is_directed
          graph.create_edge(second_node_number,node_number , edge_weight)
        end
      end

    end

    return graph
  end

  def expand_covered_graph(graph, node)

    #first node case
    if(node.shortest_path_distance_from_1st_node == MAX_NODE_DISTANCE)
      node.shortest_path_distance_from_1st_node = 0
    end

    #termination condition
    if (@covered_nodes.has_key?(node.number))
      return
    else
      @covered_nodes[node.number] = node.shortest_path_distance_from_1st_node
      @boundary_nodes.delete(node.number)
    end

    #include all its edges in boundary nodes
    for edge in node.edges
      other_node_number = (node.number == edge.first_node_number) ? edge.second_node_number : first_node_number
      other_node = graph.nodes_hash[other_node_number]

      if (!@covered_nodes.has_key?(other_node.number))
        if (other_node.shortest_path_distance_from_1st_node > node.shortest_path_distance_from_1st_node + edge.weight)
          other_node.shortest_path_distance_from_1st_node = node.shortest_path_distance_from_1st_node + edge.weight
        end
        @boundary_nodes[other_node_number] = other_node
      end
    end

    #find the node with min distance and include it in covered graph
    #should use a heap data structure
    node_with_least_distance = nil
    shortest_distance = MAX_NODE_DISTANCE
    for node in @boundary_nodes.values
      if (node.shortest_path_distance_from_1st_node < shortest_distance)
        shortest_distance = node.shortest_path_distance_from_1st_node
        node_with_least_distance = node
      end
    end

    if (!node_with_least_distance.nil?)
      expand_covered_graph(graph, node_with_least_distance)
    end

  end
end

class Graph
  attr_accessor :nodes_hash

  def initialize
    @nodes_hash = Hash.new
  end

  def nodes_count
    return @nodes_hash.count
  end

  def create_edge(first_node_number, second_node_number, edge_weight)

    first_node = find_or_create_node(first_node_number)
    second_node = find_or_create_node(second_node_number)

    first_node.add_edge(second_node_number, edge_weight)
    second_node.add_edge(first_node_number, edge_weight)
  end

  def find_or_create_node(node_number)
    node = @nodes_hash[node_number]

    if (node.nil?)
      node = Node.new(node_number)
      @nodes_hash[node_number] = node
    end

    return node
  end

end

class Node
  attr_accessor :shortest_path_distance_from_1st_node, :number, :edges, :is_covered

  def initialize(number)
    @shortest_path_distance_from_1st_node = MAX_NODE_DISTANCE
    @number = number
    @is_covered = false
    @edges = []
  end

  def add_edge(other_node_number, weight)

    for edge in edges
      if ((edge.first_node_number == other_node_number || edge.second_node_number == other_node_number) && edge.weight != weight)
        raise "duplicate edge is being inserted"
      end
    end

    edges << Edge.new(@number, other_node_number, weight)
  end

end

class Edge
  attr_accessor :weight, :first_node_number, :second_node_number

  def initialize(first_node_number, second_node_number, weight)
    @first_node_number = first_node_number
    @second_node_number = second_node_number
    @weight = weight
  end

  def get_other_node_number(node_number)

    if(@first_node_number = node_number)
      other_node_number = second_node_number
    else
      other_node_number = first_node_number
    end
  end

end