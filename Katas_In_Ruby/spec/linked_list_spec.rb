require "spec_helper"
require "../Katas/linked_list"

describe "should have no duplicates" do

  it "should delete duplicates" do

    head = Node.new(2, Node.new(3, Node.new(5, Node.new(5, Node.new(6, nil)))))

    arr = LinkedList.remove_duplicates(head);

    arr.height.should==4
  end

  it "should traverse the list" do
    head = Node.new(2, Node.new(3, Node.new(5, Node.new(5, Node.new(6, nil)))))

    arr = LinkedList.traverse(head);

    arr.length.should == 5
  end

  #Given a linked list, remove the nth node from the end of list and return its head.
  context "remove the nth node from last" do
    it "should decrease the count by one" do
      head = Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5, nil)))))

      list = LinkedList.remove_n_from_last(head, 2);

      LinkedList.traverse(list).length == 4
    end

    it "should decrease the count by one" do
      head = Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5, Node.new(6, nil))))))

      list = LinkedList.remove_n_from_last(head, 2);
      list = LinkedList.remove_n_from_last(list, 2);

      LinkedList.traverse(list).length == 4
    end

  end

  context "reverse a list" do
    it"should print list in reverse order" do
      head = Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5, Node.new(6, nil))))))

      list = LinkedList.print_reverse(head)
      list.should =~ [6,5,4,3,2,1]
    end

    it"should print list in reverse order - recursive " do
      head = Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5, Node.new(6, nil))))))
      list = []
      LinkedList.print_reverse_recursive(head, list)
      list.should =~ [6,5,4,3,2,1]
    end
  end

end