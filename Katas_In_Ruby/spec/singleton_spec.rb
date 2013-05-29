require "spec_helper"
require "../Katas/singleton"

describe "Singleton behaviour" do

  # Implementation of a singleton pattern must satisfy the single instance
  # and global access principles. It requires a mechanism to access the singleton
  # class member without creating a class object and a mechanism to persist the
  # value of class members among class objects.
  it "should allow access without creating an object" do
    instance = Singleton.get_instance()
    instance.should_not be_nil
  end

  it "should only allow one instance" do
    instance1 = Singleton.get_instance()
    instance2 = Singleton.get_instance()
    instance1.should == instance2

  end

  it "should persist the change" do
    instance1 = Singleton.get_instance()
    instance2 = Singleton.get_instance()
    instance1.value = 5

    instance1.value.should == instance2 .value
  end

end