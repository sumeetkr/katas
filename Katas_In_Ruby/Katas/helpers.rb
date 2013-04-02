require "../Katas/graph_problems_solver"
require "../Katas/strongly_connected_component_in_graph_finder"
require 'dl'

# button constants
BUTTONS_OK = 0
BUTTONS_OKCANCEL = 1
BUTTONS_ABORTRETRYIGNORE = 2
BUTTONS_YESNO = 4

# return code constants
CLICKED_OK = 1
CLICKED_CANCEL = 2
CLICKED_ABORT = 3
CLICKED_RETRY = 4
CLICKED_IGNORE = 5
CLICKED_YES = 6
CLICKED_NO = 7

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
      rest = array[1..(array.height - 1)]
      vertex = GraphNode.new(first, rest)
      vertices.insert(vertices.length - 1, vertex)
    end
    return @graph = Graph.new(vertices)
  end

  def self.read_graph_problem_data_and_populate_graph(file_path, are_edges_to_be_reversed)
    @graph = DirectedGraph.new()

    File.open(file_path).each do |line|
      array = line.split(' ').map { |x| x.to_i }

      first = array[0]
      second = array[1]
      @graph.add_edge(first, second, are_edges_to_be_reversed)
    end
    return @graph
  end

  def self.write_results_to_file(path, text)
    begin
      file = File.open(path, "a")
      file << "\n"
      file.print (text)
    rescue IOError => e
      #some error occur, dir not writable etc.
      message_box("Error occured", "Error", BUTTONS_YESNO)

    ensure
      file.close unless file == nil
    end
  end

  def message_box(txt, title=APP_TITLE, buttons=BUTTONS_OK)
    user32 = DL.dlopen('user32')
    msgbox = user32['MessageBoxA', 'ILSSI']
    r, rs = msgbox.call(0, txt, title, buttons)
    return r
  end
end