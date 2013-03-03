require "spec_helper"
require "../Katas/graph_problems_solver"
require "../Katas/helpers"

describe "solves graph problems" do
  context "min cut problem" do
    #  The file "KargerMinCut.txt" contains the adjacency list representation of a simple undirected graph.
    # There are 200 vertices labeled 1 to 200. The first column in the file represents
    #the vertex label, and the particular row (other entries except the first column)
    # tells all the vertices that the vertex is adjacent to. So for example, the 6th
    #row looks like : "6	155	56	52	120	......". This just means that the vertex
    #with label 6 is adjacent to (i.e., shares an edge with) the vertices with labels
    #155,56,52,120,......,etc

    #Your task is to code up and run the randomized contraction algorithm for the min cut
    #problem and use it on the above graph to compute the min cut. (HINT: Note that you'll
    # have to figure out an implementation of edge contractions. Initially, you might want
    #to do this naively, creating a new graph from the old every time there's an edge contraction.
    #But you should also think about more efficient implementations.) (WARNING: As per the
    #video lectures, please make sure to run the algorithm many times with different random seeds,
    #and remember the smallest cut that you ever find.) Write your numeric answer in the
    #space provided. So e.g., if your answer is 5, just type 5 in the space provided.

    def init()
      @graph_populated_with_test_data = Helpers.populate_graph_with_file_content('../Sample_Data/KargerMinCut.txt')
    end

    it "should read the text file and create a graph" do
      init()
      @graph_populated_with_test_data.nodes.length.should > 0
    end

    it "should find a cut on contraction" do
      init()
      graph_clone = @graph_populated_with_test_data.deep_clone
      GraphProblemsSolver.randomly_contract_the_graph_till_it_is_left_with_two_edges(graph_clone)
      graph_clone.nodes.length.should == 2
    end

    it "should run for a number of times to find the min cut" do
      init()
      graph_clone = @graph_populated_with_test_data.deep_clone
      parallel_edges_on_min_cut = GraphProblemsSolver.find_cut_with_min_parallel_edges_count(graph_clone, 10)
      parallel_edges_on_min_cut.should == 17
    end

  end

  context "graph problems solver" do
    it "contract the graph till left with two edges" do
      graph = init_graph_with_five_edges()

      GraphProblemsSolver.randomly_contract_the_graph_till_it_is_left_with_two_edges(graph)

      graph.nodes.length.should == 2
    end

    it "finds a cut with minimum parallel edges" do
      graph = init_graph_with_five_edges()
      min_edges_count = GraphProblemsSolver.find_cut_with_min_parallel_edges_count(graph, 20)
      min_edges_count.should == 1
    end
  end

  context "vertex" do
    it "defines vertex" do
      vertex = GraphNode.new(0, [1, 3, 6, 8])

      vertex.should respond_to(:number)
      vertex.should respond_to(:neighbour_nodes_numbers)
      vertex.neighbour_nodes_numbers.length.should == 4
    end
  end

  def init_graph_with_five_edges()
    vertices_array = [GraphNode.new(0, [1, 3]),
                      GraphNode.new(1, [0, 2, 3, 4]),
                      GraphNode.new(2, [1, 3]),
                      GraphNode.new(4, [1]),
                      GraphNode.new(3, [0, 2, 1])]
    return Graph.new(vertices_array)

  end

  context "graph with 5 edges" do

    it "should initialize graph" do
      @graph_with_five_edge = init_graph_with_five_edges()
      @graph_with_five_edge.should respond_to(:nodes)
      @graph_with_five_edge.nodes.length.should == 5
    end

    it "should contract the graph" do
      @graph_with_five_edge = init_graph_with_five_edges()
      GraphProblemsSolver.randomly_contract_the_graph_till_it_is_left_with_two_edges(@graph_with_five_edge)
      @graph_with_five_edge.nodes.length.should == 2
    end

    it "should find min cut" do
      @graph_with_five_edge = init_graph_with_five_edges()
      parallel_edges_on_min_cut = GraphProblemsSolver.find_cut_with_min_parallel_edges_count(@graph_with_five_edge, 10)
      parallel_edges_on_min_cut.should == 1
    end

  end

  context "graph with 4 edges" do

    def init_graph_with_four_edges()
      vertices_array = [GraphNode.new(0, [1, 3]),
                        GraphNode.new(1, [0, 2, 3]),
                        GraphNode.new(2, [1, 3]),
                        GraphNode.new(3, [0, 2, 1])]
      @graph_with_four_edge = Graph.new(vertices_array)

    end


    it "should initialize graph" do
      @graph_with_four_edge = init_graph_with_four_edges()
      @graph_with_four_edge.should respond_to(:nodes)
      @graph_with_four_edge.nodes.length.should == 4
    end

    it "should contract the graph" do
      @graph_with_four_edge = init_graph_with_four_edges()
      GraphProblemsSolver.randomly_contract_the_graph_till_it_is_left_with_two_edges(@graph_with_four_edge)
      @graph_with_four_edge.nodes.length.should == 2
    end

    it "should find min cut" do
      @graph_with_four_edge = init_graph_with_four_edges()
      parallel_edges_on_min_cut = GraphProblemsSolver.find_cut_with_min_parallel_edges_count(@graph_with_four_edge, 2)
      parallel_edges_on_min_cut.should == 2
    end

  end

  context "graph with 3 edges" do

    before(:each) do
      vertices_array = [GraphNode.new(0, [1, 3]),
                        GraphNode.new(1, [0, 3]),
                        GraphNode.new(3, [0, 1])]
      @graph_with_three_edge = Graph.new(vertices_array)

    end

    it "should initialize graph" do

      @graph_with_three_edge.should respond_to(:nodes)
      @graph_with_three_edge.nodes.length.should == 3
    end

    it "should contract the graph" do
      GraphProblemsSolver.randomly_contract_the_graph_till_it_is_left_with_two_edges(@graph_with_three_edge)
      @graph_with_three_edge.nodes.length.should == 2
      @graph_with_three_edge.nodes.values.first.neighbour_nodes_numbers.length.should == 2
    end
  end

  context "depth first search" do
    before(:each) do
      nodes_array = [GraphNode.new(0, [1, 3]),
                     GraphNode.new(1, [0, 2, 3, 4]),
                     GraphNode.new(2, [1, 3]),
                     GraphNode.new(4, [1]),
                     GraphNode.new(3, [0, 2, 1])]

      @graph_with_five_edges = Graph.new(nodes_array)
    end

    #  it aggressively explores the graph, returning only when no option left
    it "should search all nodes" do
      @graph_with_five_edges.depth_first_search(@graph_with_five_edges.nodes.values[0])
      @graph_with_five_edges.is_graph_completely_searched().should == true
    end

    it "should search the second neighbour only when all paths of the 1st neighbour has been explored" do

    end
  end


  context "breadth first search" do
    before(:each) do
      nodes_array = [GraphNode.new(0, [1, 3]),
                     GraphNode.new(1, [0, 2, 3, 4]),
                     GraphNode.new(2, [1, 3]),
                     GraphNode.new(4, [1]),
                     GraphNode.new(3, [0, 2, 1])]

      @graph_with_five_edges = Graph.new(nodes_array)
    end

    #  it aggressively explores the graph, returning only when no option left
    it "should search all nodes" do
      @graph_with_five_edges.breadth_first_search(@graph_with_five_edges.nodes.values[0])
      @graph_with_five_edges.is_graph_completely_searched().should == true
    end

    it "should search the second neighbour only when all paths of the 1st neighbour has been explored" do

    end
  end
end