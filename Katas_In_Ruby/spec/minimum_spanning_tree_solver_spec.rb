require "spec_helper"
require "../Katas/minimum_spanning_tree_solver"
require "../Katas/dijkstra_shortest_path_finder"

describe "MinimumSpanningTreeSolver" do

  #Problem description
  #Undirected graphs, given as Adjacency list, array of vertices or array of edges and cost of edges
  #output graph is minimum cost tree that spans all vertices
  #output Graph has no cycles and  is connected

  context "construct graph with desired constraints" do
    it "all nodes in graph could be traversed" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData2.txt")

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      #first_node.shortest_path_distance_from_1st_node = 0 #set 1st nodes distance to be zero
      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == graph.nodes_count
    end
  end

  context "expands the covered graph" do
    before(:each) do
      @graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData2.txt")
      @solver = MinimumSpanningTreeSolver.new(@graph)

    end

    it "starts from a random node" do
      random_node_to_start = @graph.nodes_hash.values.sample()
      random_node_to_start.should be_a_kind_of(Node)
    end

    it "expands to cover the nearest node with least edge cost" do
      random_node_to_start = @graph.nodes_hash.values.sample()
      min_spanning_tree_graph = @solver.expand(random_node_to_start)
      @solver.min_spanning_tree_graph.nodes_hash.values.should include(random_node_to_start)
      @solver.min_spanning_tree_graph.nodes_hash.values.should include(random_node_to_start)
    end

    it "expands increases the covered node count by 1" do
      random_node_to_start = @graph.nodes_hash.values.sample()
      expect{@solver.expand(random_node_to_start)}.to change { @solver.min_spanning_tree_graph.nodes_hash.values.count }.by(2)
      expect{@solver.expand(random_node_to_start)}.to change { @solver.min_spanning_tree_graph.nodes_hash.values.count }.by(0)
    end


  end
end