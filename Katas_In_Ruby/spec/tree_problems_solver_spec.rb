require "spec_helper"
require "../Katas/tree_problems_solver"

describe "binary tree problems behaviour" do

  context "tree" do
    before(:each) do
      @tree = BinaryTree.new(5)
    end

    def insert_more_nodes()
      for i in 1..4
        BinaryTree.insert(@tree.root, i)
      end
      for i in 6..10
        BinaryTree.insert(@tree.root, i)
      end
    end

    it "should insert a new node at the right place" do

    end

    it "should return the nodes in order" do
      insert_more_nodes()
      keys = BinaryTree.get_keys_in_order_traversal(@tree.root)
      keys.should match_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    end

    it "should find if tree is symmetrical" do
      insert_more_nodes()
      keys_in_order = BinaryTree.get_keys_in_order_traversal(@tree.root)

      keys_in_order.count().should == 10
    end
  end

  it "should find the lowest common ancestor" do

    #Given a binary tree, find the lowest common ancestor of two given nodes in the tree

    #first_node = Node.new()
    #tree = Node.new(0, Node.new(-1, Node.new(-3, nil, nil), Node.new(-2, nil, nil)),Node.new(1, nil, nil))
    #TreeProblemsSolver.find_lowest_common_ancestor()

  end

  attr_accessor a
  it "bad try" do
    a.inspect
  end

end