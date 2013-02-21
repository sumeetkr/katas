class GraphProblemsSolver
  # To change this template use File | Settings | File Templates.

end

class Vertex
  attr_accessor :number, :neighbour_vertices_number

  def initialize(vertex_number, neighbour_vertices_number_array)
    @number = vertex_number
    @neighbour_vertices_number = neighbour_vertices_number_array
  end
end

class Graph
  attr_accessor :vertices

  def initialize(vertices)
    @vertices = vertices
  end

  def deep_clone()
    return deep_cloned = Marshal::load(Marshal.dump(self))
  end

  def find_cut_with_min_parallel_edges_count(number_of_times_to_be_run)

    min = 2000

    for i in 1..number_of_times_to_be_run
      graph_clone = deep_clone
      graph_clone.make_a_random_cut
      parralel_edges_count = graph_clone.vertices[0].neighbour_vertices_number.length
      if (parralel_edges_count < min)
        min = parralel_edges_count
      end
    end

    return min
  end

  def make_a_random_cut()
    #a cut of a graph is dividing a graph in two parts

    random_number_generator = Random.new()

    while vertices.length > 2
      first_vertex = @vertices[(random_number_generator.rand(0..(vertices.length - 1)))]
      random_neighbour_number = first_vertex.neighbour_vertices_number[
          (random_number_generator.rand(0..(first_vertex.neighbour_vertices_number.length - 1)))]
      second_vertex = @vertices.select { |vertex| vertex.number == random_neighbour_number }.first

      if (!second_vertex.nil? && first_vertex.number != second_vertex.number)
        contract(first_vertex, second_vertex)
      end
    end
  end

  private;


  def contract(first_vertex, second_vertex)
    first_vertex.neighbour_vertices_number.concat(second_vertex.neighbour_vertices_number)
    first_vertex.neighbour_vertices_number.delete_if {
        |vertex_number| (vertex_number == second_vertex.number) || (vertex_number == first_vertex.number) }

    @vertices.delete(second_vertex)

    #update all the related vertices, second vertex should be replaced with first vertex
    for vertex_number in second_vertex.neighbour_vertices_number

      if (vertex_number != first_vertex.number)
        #replace the second vertex number with first vertex number
        neighbour_vertex = @vertices.select { |vertex| vertex.number == vertex_number }.first
        index = neighbour_vertex.neighbour_vertices_number.index(second_vertex.number)
        neighbour_vertex.neighbour_vertices_number[index] = first_vertex.number
      end

      #
      #vertex.neighbour_vertices_number
      #
      #if (vertex.number != first_vertex.number)
      #  neighbours = vertex.neighbour_vertices_number
      #
      #  current_index = 0
      #  while current_index < neighbours.length
      #    if (neighbours[current_index] == second_vertex.number)
      #      neighbours[current_index] = first_vertex.number
      #    end
      #
      #    current_index += 1
      #  end
      #end
    end
  end
end