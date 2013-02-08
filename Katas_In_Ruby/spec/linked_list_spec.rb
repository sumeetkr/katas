require "spec_helper"
require "../Katas/linked_list"

describe "should have no duplicates" do

  it "should delete duplicates" do

    head = Node.new(2, Node.new(3, Node.new(5, Node.new(5, Node.new(6, nil)))))

    arr = LinkedList.remove_duplicates(head);

    arr.length.should==4
  end

  it "should traverse the list" do
    head = Node.new(2, Node.new(3, Node.new(5, Node.new(5, Node.new(6, nil)))))

    arr = LinkedList.traverse(head);

    arr.length.should == 5
  end
end