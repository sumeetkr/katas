require "spec_helper"
require "../Katas/heap_problems_solver"
require "../Katas/helpers"

describe "Heap problems behaviour" do

  describe "Node" do
    subject { HeapNode.new(10) }

    it { should respond_to(:key) }
    it { should respond_to(:value) }
  end

  describe "Heap" do

    before() do
      @heap = Heap.new()
    end
    subject { @heap }

    it { should_not be_nil }
    it { should respond_to(:array_of_nodes) }
    it { should respond_to(:is_min_heap) }
    its(:is_min_heap) {should be_true}

    it "insert, inserts node, increases heap size" do
      lambda {
        subject.insert(HeapNode.new(1))
        subject.insert(HeapNode.new(15))
        subject.insert(HeapNode.new(0))
        subject.insert(HeapNode.new(25))
      }.should change(@heap, :count).by(4)
    end

    it "find, finds min node, no change in size" do
      lambda {
        subject.find_root_node
      }.should change(@heap, :count).by(0)
    end

    it "should rebalance on insert" do
      heap = Heap.new()
      heap.insert(HeapNode.new(5))
      heap.find_root_node.key.should == 5
      heap.count.should == 1

      heap.insert(HeapNode.new(1))
      heap.find_root_node.key.should == 1
      heap.count.should == 2

      heap.insert(HeapNode.new(6))
      heap.find_root_node.key.should == 1
      heap.count.should == 3

      heap.insert(HeapNode.new(7))
      heap.find_root_node.key.should == 1
      heap.count.should == 4

      heap.insert(HeapNode.new(0))
      heap.find_root_node.key.should == 0
      heap.count.should == 5

      heap.insert(HeapNode.new(-1))
      heap.find_root_node.key.should == -1
      heap.count.should == 6

    end

    it "should do heap rebalance on get - case 1" do
      heap = Heap.new()
      heap.insert(HeapNode.new(5))
      heap.insert(HeapNode.new(6))
      heap.insert(HeapNode.new(8))
      heap.insert(HeapNode.new(9))
      heap.insert(HeapNode.new(10))
      heap.insert(HeapNode.new(11))
      heap.insert(HeapNode.new(12))
      heap.insert(HeapNode.new(13))

      node = heap.get_root_node()
      node.key.should == 5
      heap.count.should == 7

      node = heap.get_root_node()
      node.key.should == 6
      heap.count.should == 6

      node = heap.get_root_node()
      node.key.should == 8
      heap.count.should == 5

      node = heap.get_root_node()
      node.key.should == 9
      heap.count.should == 4

      node = heap.get_root_node()
      node.key.should == 10
      heap.count.should == 3

      node = heap.get_root_node()
      node.key.should == 11
      heap.count.should == 2

      node = heap.get_root_node()
      node.key.should == 12
      heap.count.should == 1

      node = heap.get_root_node()
      node.key.should == 13
      heap.count.should == 0

    end


    it "should rebalance on get - case 2" do
      heap = Heap.new()
      heap.insert(HeapNode.new(3))
      heap.insert(HeapNode.new(5))
      heap.insert(HeapNode.new(4))

      node = heap.get_root_node()
      node.key.should == 3
      heap.count.should == 2

      node = heap.get_root_node()
      node.key.should == 4
      heap.count.should == 1

      node = heap.get_root_node()
      node.key.should == 5
      heap.count.should == 0
    end

    it "get, returns min node and deletes root node, rebalances tree" do
      heap = Heap.new()
      heap.insert(HeapNode.new(5))
      heap.insert(HeapNode.new(1))
      heap.insert(HeapNode.new(6))
      heap.insert(HeapNode.new(7))
      heap.insert(HeapNode.new(4))
      heap.insert(HeapNode.new(40))
      heap.insert(HeapNode.new(10))
      heap.insert(HeapNode.new(0))

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
      heap.insert(HeapNode.new(5))
      heap.insert(HeapNode.new(1))
      heap.insert(HeapNode.new(6))
      heap.insert(HeapNode.new(7))
      heap.insert(HeapNode.new(4))
      heap.insert(HeapNode.new(10))
      heap.insert(HeapNode.new(0))

      heap.find_root_node.key.should == 0
      heap.is_heap.should be_true
    end


  end

  context "find_median_of_an_array_in_ith_step" do

    it "should return the right median at any insertion" do

      solver = FindMedianSolver.new
      median_node = solver.insert_new_node_and_return_median_node(HeapNode.new(1))
      solver.total_count.should == 1
      median_node.key.should == 1

      median_node = solver.insert_new_node_and_return_median_node(HeapNode.new(2))
      solver.total_count.should == 2
      median_node.key.should == 1

      median_node = solver.insert_new_node_and_return_median_node(HeapNode.new(3))
      solver.total_count.should == 3
      median_node.key.should == 2

    end

    it "should return the right median - case 1" do
      sequence = [HeapNode.new(1), HeapNode.new(0), HeapNode.new(10), HeapNode.new(5), HeapNode.new(8),
                  HeapNode.new(2), HeapNode.new(4), HeapNode.new(12), HeapNode.new(15)]
      median_node = HeapProblemsSolver.find_median_of_an_array_of_nodes_in_ith_step(sequence)

      median_node.key.should == 5
    end

    it "should return the right median - case 2" do
      sequence = [HeapNode.new(1), HeapNode.new(10), HeapNode.new(2), HeapNode.new(9), HeapNode.new(3),
                  HeapNode.new(8), HeapNode.new(4), HeapNode.new(7), HeapNode.new(5)]
      median_node = HeapProblemsSolver.find_median_of_an_array_of_nodes_in_ith_step(sequence)

      median_node.key.should == 5
    end
  end

  context "Find median solver " do
    #The goal of this problem is to implement the "Median Maintenance" algorithm (covered in the Week 5
    #lecture on heap applications). The text file contains a list of the integers from 1 to 10000
    #in unsorted order; you should treat this as a stream of numbers, arriving one by one. Letting xi
    #denote the ith number of the file, the kth median mk is defined as the median of the numbers x1,…,xk.
    #(So, if k is odd, then mk is ((k+1)/2)th smallest number among x1,…,xk; if k is even, then mk is the
    # (k/2)th smallest number among x1,…,xk.)
    #In the box below you should type the sum of these 10000 medians, modulo 10000 (i.e., only the last 4 digits).
    #That is, you should compute (m1+m2+m3+⋯+m10000)mod10000.

    it "should return (k+1)/2 smallest number for sequence of k (k is odd) number" do
      median_solver = FindMedianSolver.new
      median = 0

      for i in 1..11
        median = median_solver.insert_new_node_and_return_median_node(HeapNode.new(i))
      end

      median.key.should == 6
    end

    it "should return (k)/2 smallest number for sequence of k (k is even) number" do
      median_solver = FindMedianSolver.new
      median = 0

      for i in 1..10
        median = median_solver.insert_new_node_and_return_median_node(HeapNode.new(i))
      end

      median.key.should == 5
    end

    it "should read the file" do
      array = Helpers.populate_array_with_file_content("../Sample_Data/Median.txt")
      array.length.should == 10000
    end

    it "should find the right sum of medians - case 1" do
      array = [9, 6, 14, 19, 8, 4]

      @median_solver = FindMedianSolver.new
      sum_of_median = 0

      index = 0
      for index in 0..(array.length - 1)
        median = @median_solver.insert_new_node_and_return_median_node(HeapNode.new(array[index])).key
        sum_of_median += median
      end

      sum_of_median.should == 50
    end

    it "should find the sum of medians - case 2" do
      array = Helpers.populate_array_with_file_content("../Sample_Data/Median2.txt")

      median_solver = FindMedianSolver.new
      sum_of_median = 0

      for i in array
        sum_of_median += median_solver.insert_new_node_and_return_median_node(HeapNode.new(i)).key
      end


      sum_of_median.should == 12588046
    end

    it "should find the sum of medians - case 3" do
      array = Helpers.populate_array_with_file_content("../Sample_Data/Median.txt")

      median_solver = FindMedianSolver.new
      sum_of_median = 0

      for i in array
        sum_of_median += median_solver.insert_new_node_and_return_median_node(HeapNode.new(i)).key
      end

      sum_of_median.should == 46831213
    end

  end
end
