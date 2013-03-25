class StronglyConnectedComponentInGraphFinder
  attr_accessor :nodes_order_of_finishing

  def initialize
    #@node_traversal_path_track = "" # for debug
    #@node_finishing_time_track = "" # for debug

    @number_of_nodes_finished = 0
    @current_source_node = nil
    @nodes_order_of_finishing = []
    @strongly_connected_components_hash = Hash.new
    @nodes_traversed_stack=[]
  end

  def mark_finishing_time(graph)

    for node in graph.nodes_hash.values
      if (!node.is_explored)
        depth_first_search(graph, node)
        #@nodes_order_of_finishing.push(node.number)
      end
    end

  end

  def find_strongly_connected_components(graph, node_order_of_traversal)
    # reverse the graph
    # make dfs and mark the nodes with their point
    # dfs the original graph with leaders

    for node_number in node_order_of_traversal
      node = graph.nodes_hash[node_number]
      if (!node.is_explored)
        @current_source_node = node
        @strongly_connected_components_hash[node.number] = 0
        depth_first_search(graph, node)
      end
    end


    return @strongly_connected_components_hash
  end

  def depth_first_search_iterative(graph, start_node)
    start_node.is_explored = true
    @nodes_traversed_stack.push (start_node)

    for node in graph.get_neighbour_nodes(start_node.number)
      unless node.is_explored
        depth_first_search(graph, node)
      end
    end

  end

  def depth_first_search(graph, start_node)
    start_node.is_explored = true
    #@current_source_node = start_node

    #for debugging
    #@node_traversal_path_track  = @node_traversal_path_track + " -->" + start_node.number.to_s

    for node in graph.get_neighbour_nodes(start_node.number)
      unless node.is_explored
        depth_first_search(graph, node)
      end
    end

    @number_of_nodes_finished += 1
    start_node.finishing_time = @number_of_nodes_finished
    @nodes_order_of_finishing << start_node.number
    if (!@current_source_node.nil?)
      @strongly_connected_components_hash[@current_source_node.number] += 1
    end

    #for debugging
    #@node_finishing_time_track  = @node_finishing_time_track + " -->" + start_node.number.to_s + ":" +@number_of_nodes_finished.to_s
  end

end

class DirectedGraph
  attr_accessor :nodes_hash #it is a hash of node number and Node object

  def initialize
    @nodes_hash = Hash.new
  end

  def add_edge(from_node_number, to_node_number, is_reverse)
    #  get or create from_node
    from_node = @nodes_hash[from_node_number]
    if (from_node.nil?)
      from_node = Node.new(from_node_number)
      @nodes_hash[from_node_number] = from_node
    end

    #  get or create to_node
    to_node = @nodes_hash[to_node_number]
    if (to_node.nil?)
      to_node = Node.new(to_node_number)
      @nodes_hash[to_node_number] = to_node
    end

    unless is_reverse
      from_node.add_neighbour(to_node.number)
    else
      to_node.add_neighbour(from_node.number)
    end

  end

  def get_neighbour_nodes(node_number)
    neighbour_node_numbers = @nodes_hash[node_number].neighbour_node_numbers

    neighbour_nodes= []
    for node_number in neighbour_node_numbers
      neighbour_nodes << @nodes_hash[node_number]
    end

    return neighbour_nodes
  end

  def are_all_nodes_explored()
    is_node_explored = true

    for node in @nodes_hash.values
      if (!node.is_explored)
        is_node_explored = false
      end
    end

    return is_node_explored
  end

  def delete_all_edges
    for node in @nodes_hash.values
      node.neighbour_node_numbers = []
    end
  end

end

class Node
  attr_accessor :is_explored, :number, :neighbour_node_numbers, :finishing_time

  def initialize(number)
    @number = number
    @is_explored = false
    @neighbour_node_numbers = []
    @finishing_time = 0
  end

  def add_edge(neighbour_node_numbers)
    @neighbour_node_numbers << neighbour_node_numbers
  end

end
