require "spec_helper"
require "../Katas/dijkstra_shortest_path_finder"

describe "dijkstra shortest path finder behaviour" do

#The file contains an adjacency list representation of an undirected weighted graph with 200 vertices
#labeled 1 to 200. Each row consists of the node tuples that are adjacent to that particular vertex along
# with the length of that edge. For example, the 6th row has 6 as the first entry indicating that this
#row corresponds to the vertex labeled 6. The next entry of this row "141,8200" indicates that there is
#an edge between vertex 6 and vertex 141 that has length 8200. The rest of the pairs of this row indicate
#the other vertices adjacent to vertex 6 and the lengths of the corresponding edges.

#Your task is to run Dijkstra's shortest-path algorithm on this graph, using 1 (the first vertex) as
#the source vertex, and to compute the shortest-path distances between 1 and every other vertex of the
#graph. If there is no path between a vertex v and vertex 1, we'll define the shortest-path distance
#between 1 and v to be 1000000.

  context "dijkstra_shortest path finder" do

    it "should initialize graph with 200 nodes" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData.txt")
      graph.nodes_count.should == 200
    end

    it " should expand covered node" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData2.txt")
      graph.nodes_count.should == 5

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 5
    end
  end

  context "dijkstra_shortest path finder 2" do

    it " should expand covered node" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData3.txt")
      graph.nodes_count.should == 5

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 5
    end
  end

  context "dijkstra_shortest path finder 3" do

    it " should expand covered node" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData.txt")
      graph.nodes_count.should == 200

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[141]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 200

      array_shortest_distance = []
      for i in [3, 22, 27, 28, 32, 33, 35, 47, 55, 59, 71, 95, 114, 124, 136, 139, 179, 186, 188, 194]
        array_shortest_distance << finder.covered_nodes[i]
      end

      array_shortest_distance[0].should== 2207
    end
  end

  context "dijkstra_shortest path finder 31" do

    it " should expand covered node" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData.txt")
      graph.nodes_count.should == 200

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 200

      array_shortest_distance = []
      for i in 1..6
        array_shortest_distance << finder.covered_nodes[i]
      end

      array_shortest_distance[1].should== 2971
    end
  end

  context "dijkstra_shortest path finder 4" do

    it " should expand covered node" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData.txt")
      graph.nodes_count.should == 200

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 200

      array_shortest_distance = []
      for i in [7, 37, 59, 82, 99, 115, 133, 165, 188, 197]
        array_shortest_distance << finder.covered_nodes[i]
      end

      (array_shortest_distance - [2599, 2610, 2947, 2052, 2367, 2399, 2029, 2442, 2505, 3068]).should == []
    end


    it " should find the relative distance" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData.txt")
      graph.nodes_count.should == 200

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 200

      array_shortest_distance = []
      for i in [17, 76, 148, 164, 199]
        array_shortest_distance << finder.covered_nodes[i]
      end

      (array_shortest_distance - [3111, 3220, 2873, 1693, 815]).should == []


    end


  end

  context "dijkstra_shortest path finder 5" do

    it " should expand covered node" do
      graph = DijkstraShortestPathFinder.populate_dijkastra_graph_with_file_content("../Sample_Data/dijkstraData4.txt")
      graph.nodes_count.should == 6

      finder = DijkstraShortestPathFinder.new
      first_node = graph.nodes_hash[1]
      first_node.shortest_path_distance_from_1st_node = 0

      finder.expand_covered_graph(graph, first_node)

      finder.covered_nodes.count.should == 6

      array_shortest_distance = []
      for i in 1..6
        array_shortest_distance << finder.covered_nodes[i]
      end
      array_shortest_distance[5].should== 11
    end
  end

  context "Node" do
    subject { Node.new(1) }

    it { should respond_to(:shortest_path_distance_from_1st_node) }
    it { should respond_to (:number) }
    it { should respond_to(:edges) }
    it { should respond_to(:is_covered) }
  end

  context "Edge" do
    subject { Edge.new(1, 2, 5) }

    it { should respond_to(:weight) }
    it { should respond_to(:first_node_number) }
    it { should respond_to(:second_node_number) }
  end

  context "Graph" do
    before do
      @graph = Graph.new
    end

    subject { @graph }

    it "should allow to insert nodes" do
      lambda {
        @graph.create_edge(10, 5, 10)
      }.should change(@graph, :nodes_count).by(2)

      lambda {
        @graph.create_edge(10, 4, 10)
      }.should change(@graph, :nodes_count).by(1)

      lambda {
        @graph.create_edge(4, 5, 10)
      }.should change(@graph, :nodes_count).by(0)

    end

    it "should allow to find a node" do

    end


  end


end