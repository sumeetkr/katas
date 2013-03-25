require "spec_helper"
require "../Katas/max_weight_independent_set_finder"

describe "MaxIndependentSet behaviour" do

  context "as a Node" do
    before(:each) do
      @mis_node = MIS_Node.new(5, 10)
    end
    subject(:mis_node) { @mis_node }

    it { should respond_to(:number) }
    it { should respond_to(:weight) }
    it { should respond_to(:neighbour_numbers) }

    its(:weight) { should == 10 }
    its(:number) { should == 5 }

    it "add edge should increase the neighbour numbers" do
      lambda {
        @mis_node.add_edge(10)
      }.should change(@mis_node.neighbour_numbers, :length).by(1)
    end

  end

  context "Graph" do
    before(:all) do
      @mis_graph = MIS_Graph.new()
      @mis_graph.add_node(5, 5)
    end
    subject(:mis_graph) { @mis_graph }

    it { should respond_to(:nodes_hash) }

    it "add node should increase the nodes hash count" do
      lambda {
        @mis_graph.add_node(10, 5)
        @mis_graph.add_node(9, 6)
      }.should change(@mis_graph.nodes_hash, :length).by(2)
    end

    it "create edge should increase the neighbour nodes count of nodes" do
      lambda {
        @mis_graph.add_node(6, 6)
        @mis_graph.create_edge(5, 6)
      }.should change(@mis_graph.nodes_hash[5].neighbour_numbers, :length).by(1)
    end

  end


  context "MaxIndependentSet" do
    before(:each) do
      @finder = MaxWeightIndependentSetFinder.new
      @graph = MaxWeightIndependentSetFinder.build_sample_graph()
    end

    subject(:finder) { @finder }

    it "find should find max independent set- case1" do
     val = @finder.find(@graph)
      val.should == 8
    end

  end

end