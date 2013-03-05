require "spec_helper"
require "../Katas/heap_problems_solver"

describe "Heap problems behaviour" do

  context "Heap" do

    before() do
      @heap = Heap.new()
    end
    subject { @heap }

    it { should_not be_nil }

    it "insert, insert node increases heap size" do
      lambda {
        subject.insert(Node.new(1))
        subject.insert(Node.new(15))
        subject.insert(Node.new(0))
        subject.insert(Node.new(25))
      }.should change(@heap, :count).by(4)
    end

    it "find, finds min node" do
      lambda {
        subject.find_root_node
      }.should change(@heap, :count).by(0)
    end

    it "get, returns min node and deletes root node, rebalances tree" do
      heap = Heap.new()
      heap.insert(Node.new(5))
      heap.insert(Node.new(1))
      heap.insert(Node.new(6))
      heap.insert(Node.new(7))
      heap.insert(Node.new(4))
      heap.insert(Node.new(40))
      heap.insert(Node.new(10))
      heap.insert(Node.new(0))

      lambda {
        node = heap.get_root_node
        node.key.should == 0
      }.should change(heap, :count).by(-1)

      heap.is_heap.should be_true

      lambda {
        node = heap.get_root_node
        node.key.should == 1
      }.should change(heap, :count).by(-1)

      heap.is_heap.should be_true
    end

    it "should do heap rebalancing on insert" do
      heap = Heap.new()
      heap.insert(Node.new(5))
      heap.insert(Node.new(1))
      heap.insert(Node.new(6))
      heap.insert(Node.new(7))
      heap.insert(Node.new(4))
      heap.insert(Node.new(10))
      heap.insert(Node.new(0))

      heap.find_root_node.key.should == 0
      heap.is_heap.should be_true
    end


  end

  context "Node" do
    subject { Node.new(10) }

    it { should respond_to(:key) }
    it { should respond_to(:value) }
  end

  context "find_median_of_an_array_in_ith_step" do

    it "should return the right median" do
      sequence = [Node.new(1), Node.new(0), Node.new(10), Node.new(5), Node.new(8),
                  Node.new(2), Node.new(4), Node.new(12), Node.new(15)]
      median_node = HeapProblemsSolver.find_median_of_an_array_of_nodes_in_ith_step(sequence)
      median_node.key.should == 5
    end

    it "should return the right median" do
      sequence = [Node.new(1), Node.new(10), Node.new(2), Node.new(9), Node.new(3),
                  Node.new(8), Node.new(4), Node.new(7), Node.new(5)]
      median_node = HeapProblemsSolver.find_median_of_an_array_of_nodes_in_ith_step(sequence)
      median_node.key.should == 5
    end

  end
end