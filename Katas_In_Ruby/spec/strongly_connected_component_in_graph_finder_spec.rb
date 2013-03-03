require "spec_helper"
require "../Katas/helpers"
require "../Katas/strongly_connected_component_in_graph_finder"

describe "graph behaviour" do

  context "StronglyConnectedComponentInGraphFinder behaviour" do
    before do
      @directed_graph = Helpers.read_graph_problem_data_and_populate_graph("../Sample_Data/SCC_Graph_Problem3.txt", false)
      @directed_reverse_graph = Helpers.read_graph_problem_data_and_populate_graph("../Sample_Data/SCC_Graph_Problem3.txt", true)
      @scc_graph_finder = StronglyConnectedComponentInGraphFinder.new
    end

    it " should have a few nodes" do
      @directed_reverse_graph.nodes_hash.keys.count.should > 0
    end

    it "dfs should expore all nodes" do
      @scc_graph_finder.depth_first_search(@directed_reverse_graph, @directed_reverse_graph.nodes_hash[8])
      @directed_reverse_graph.are_all_nodes_explored().should == true
    end

    it "mark_finishing_time should mark finishing time of graph correctly" do
      #@scc_graph_finder.mark_finishing_time(@directed_reverse_graph)
      #@directed_reverse_graph.are_all_nodes_explored().should == true
      ##write results to a file
      #Helpers.write_results_to_file("../Sample_Data/Results.txt", @scc_graph_finder.nodes_order_of_finishing.to_s)
    end

    it " should have 4 strongly connected components " do
      #it has four strongly connected components with sizes 4, 3, 3, and 1 (so the answer would be 4,3,3,1,0).
      @scc_graph_finder.mark_finishing_time(@directed_reverse_graph)
      @directed_reverse_graph.are_all_nodes_explored().should == true
      Helpers.write_results_to_file("../Sample_Data/Results.txt", @scc_graph_finder.nodes_order_of_finishing.to_s)

      node_order_of_traversal = @scc_graph_finder.nodes_order_of_finishing.reverse
      another_scc_graph_finder = StronglyConnectedComponentInGraphFinder.new
      strongly_connected_components_array = another_scc_graph_finder.find_strongly_connected_components(@directed_graph, node_order_of_traversal)


      sorted_by_val = strongly_connected_components_array.sort_by { |_key, value| value }
      Helpers.write_results_to_file("../Sample_Data/SCC_Results.txt", sorted_by_val.to_s)

      strongly_connected_components_array.count.should == 4

    end


  end

  context "Node" do
    before(:each) do
      @node = Node.new(10)
    end

    it " should have some attributes" do
      @node.should respond_to(:is_explored)
      @node.should respond_to(:number)
      @node.should respond_to(:neighbour_node_numbers)
    end

    it "add neighbour should increase the neighbour nodes count" do
      lambda {
        @node.add_neighbour(5)
      }.should change(@node.neighbour_node_numbers, :count).by(1)

    end
  end

  context "DirectedGraph" do

    before(:each) do
      @directed_reverse_graph = DirectedGraph.new()
      @directed_reverse_graph.add_edge(10, 5, false)
      @directed_reverse_graph.add_edge(10, 4, false)
      @directed_reverse_graph.add_edge(5, 4, false)
    end

    let(:directed_graph) { @directed_reverse_graph }

    it " should have some attributes " do
      directed_graph.should respond_to(:nodes_hash)
    end

    it " should have 3 nodes" do
      directed_graph.nodes_hash.keys.count.should == 3
    end

    it " node 10 should have 2 neighbours" do
      directed_graph.nodes_hash[10].neighbour_node_numbers.count.should == 2
      directed_graph.nodes_hash[10].neighbour_node_numbers[0].should == 5
      directed_graph.nodes_hash[10].neighbour_node_numbers[1].should == 4
    end

  end
end