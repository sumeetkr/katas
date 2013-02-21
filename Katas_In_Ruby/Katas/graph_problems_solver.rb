class GraphProblemsSolver

  def self.find_cut_with_min_parallel_edges_count(graph, number_of_times_to_be_run)

    min = 2000

    for i in 1..number_of_times_to_be_run
      graph_clone = graph.deep_clone
      randomly_contract_the_graph_till_it_is_left_with_two_edges(graph_clone)
      parralel_edges_count = graph_clone.nodes[0].neighbour_vertices_number.length
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
      first_vertex = graph.nodes[(random_number_generator.rand(0..(graph.nodes.length - 1)))]

      random_neighbour_number = first_vertex.neighbour_vertices_number[
          (random_number_generator.rand(0..(first_vertex.neighbour_vertices_number.length - 1)))]
      second_vertex = graph.nodes.select { |vertex| vertex.number == random_neighbour_number }.first

      if (!second_vertex.nil? && first_vertex.number != second_vertex.number)
        graph.contract(first_vertex, second_vertex)
      end
    end
  end
end

class Vertex
  attr_accessor :number, :neighbour_vertices_number

  def initialize(vertex_number, neighbour_vertices_number_array)
    @number = vertex_number
    @neighbour_vertices_number = neighbour_vertices_number_array
  end
end

class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def contract(first_vertex, second_vertex)
    first_vertex.neighbour_vertices_number.concat(second_vertex.neighbour_vertices_number)
    first_vertex.neighbour_vertices_number.delete_if {
        |vertex_number| (vertex_number == second_vertex.number) || (vertex_number == first_vertex.number) }

    @nodes.delete(second_vertex)

    update_vertex_neighbours_to_point_to_different_vertex(first_vertex, second_vertex)
  end


  def update_vertex_neighbours_to_point_to_different_vertex(first_vertex, second_vertex)

    #update all the related nodes, second vertex should be replaced with first vertex
    for vertex_number in second_vertex.neighbour_vertices_number
      if (vertex_number != first_vertex.number)
        #replace the second vertex number with first vertex number
        neighbour_vertex = @nodes.select { |vertex| vertex.number == vertex_number }.first
        index = neighbour_vertex.neighbour_vertices_number.index(second_vertex.number)
        neighbour_vertex.neighbour_vertices_number[index] = first_vertex.number
      end
    end
  end

  def deep_clone()
    return deep_cloned = Marshal::load(Marshal.dump(self))
  end
end