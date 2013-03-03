class GraphProblemsSolver

  def self.find_cut_with_min_parallel_edges_count(graph, number_of_times_to_be_run)

    min = 2000

    for i in 1..number_of_times_to_be_run
      graph_clone = graph.deep_clone
      randomly_contract_the_graph_till_it_is_left_with_two_edges(graph_clone)
      parralel_edges_count = graph_clone.nodes[graph_clone.nodes.keys.first].neighbour_nodes_numbers.length
      if (parralel_edges_count < min)
        min = parralel_edges_count
      end
    end

    return min
  end

  def self.randomly_contract_the_graph_till_it_is_left_with_two_edges(graph)
    #a cut of a graph is dividing a graph in two parts
    random_number_generator = Random.new()

    while graph.nodes.length > 2
      random_number = random_number_generator.rand(0..(graph.nodes.length - 1))
      random_key = graph.nodes.keys[random_number]

      first_vertex_number = random_key
      first_vertex = graph.nodes[first_vertex_number]

      if (!first_vertex.nil?)
        random_neighbour_number = random_number_generator.rand(0..(first_vertex.neighbour_nodes_numbers.length - 1))
        second_vertex = graph.nodes[random_neighbour_number]

        if (!second_vertex.nil? && first_vertex_number != random_neighbour_number)
          graph.contract(first_vertex, second_vertex)
        end
      end
    end
  end

end

class GraphNode
  attr_accessor :number, :neighbour_nodes_numbers, :is_explored

  def initialize(node_number, neighbour_nodes_number_array)
    @number = node_number
    @neighbour_nodes_numbers = neighbour_nodes_number_array
    @is_explored = false
  end
end

class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = Hash.new()

    nodes.each do |node|
      @nodes[node.number] = node
    end

    @nodes_traversed =[]
  end

  def depth_first_search(start_node)
    #  it aggressively explores the graph, returning only when no option left
    # add the traversed nodes in a stack, mark it explored
    # check a random neighbour, if it has not been explored,
    # if no unexlored neighbour, back track the stack, call dfs on this node
    # if not explored, call dfs on this neighbour node

    start_node.is_explored = true
    @nodes_traversed.push(start_node)

    for neighbour_node in get_neighbours_of_a_node(start_node)
      unless (@nodes_traversed.include?(neighbour_node))
        depth_first_search(neighbour_node)
      end
    end
    @nodes_traversed.pop()
  end

  def breadth_first_search(start_node)
    #  it aggressively explores the graph, exploring all neighbours of a node before moving to the next level
    # add the traversed nodes in a queue or mark it explored
    # check a random neighbour, if it has not been explored,
    # if no unexlored neighbour, back track the queue, call bfs on this node
    # if not explored, call bfs on this neighbour node

    start_node.is_explored = true
    #@nodes_traversed.push(start_node)

    for neighbour_node in get_neighbours_of_a_node(start_node)
      unless (neighbour_node.is_explored)
        breadth_first_search(neighbour_node)
      end
    end
    #@nodes_traversed.pop()
  end

  def is_graph_completely_searched()
    is_completely_searched = true

    for node in @nodes.values
      if (node.is_explored == false)
        is_completely_searched = false
      end
    end

    return is_completely_searched
  end

  def get_neighbours_of_a_node(node)
    neighbours = []

    for node_number in node.neighbour_nodes_numbers
      neighbours.push(@nodes[node_number])
    end

    return neighbours
  end

  def contract(first_node, second_node)
    first_node.neighbour_nodes_numbers.concat(second_node.neighbour_nodes_numbers)
    first_node.neighbour_nodes_numbers.delete_if {
        |vertex_number| (vertex_number == second_node.number) || (vertex_number == first_node.number) }

    update_node_neighbours_to_point_to_different_node(first_node, second_node)

    @nodes.delete(second_node.number)
  end

  def update_node_neighbours_to_point_to_different_node(first_node, second_node)

    #update all the related nodes, second vertex should be replaced with first vertex
    for vertex_number in second_node.neighbour_nodes_numbers
      if (vertex_number != first_node.number)
        #replace the second vertex number with first vertex number
        neighbour_vertex = @nodes[vertex_number]
        index = neighbour_vertex.neighbour_nodes_numbers.index(second_node.number)
        neighbour_vertex.neighbour_nodes_numbers[index] = first_node.number
      end
    end
  end

  def deep_clone()
    return deep_cloned = Marshal::load(Marshal.dump(self))
  end
end