require "../Katas/graph_problems_solver"

class Helpers

  def self.populate_array_with_file_content(file_path)

    array = Array.new

    File.open(file_path).each do |line|
      array << line.to_i
    end
    return array
  end

  def self.populate_graph_with_file_content(file_path)

    vertices = []

    File.open(file_path).each do |line|
      #make a vertex
      array = line.split(' ').map { |x| x.to_i }

      first = array[0]
      rest = array[1..(array.length - 1)]
      vertex = Node.new(first, rest)
      vertices.insert(vertices.length - 1, vertex)
    end
    return @graph = Graph.new(vertices)
  end
end