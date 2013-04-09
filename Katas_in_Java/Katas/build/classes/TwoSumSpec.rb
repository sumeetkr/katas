require 'rspec'
require "java"
require 'Katas_In_Java.jar'

$CLASSPATH << File.expand_path('Katas/src/') 
$CLASSPATH << 'Katas/src' 
puts $CLASSPATH

java_import Java::katas.MarsRover
java_import Java::katas.TwoSumProblemSolver

puts "Hello from ruby"

class TwoSumProblemSolverSpec
  def initialize
    super
    @count = 0
  end

  def say(msg)
    puts "Ruby saying #{msg}"
  end
  
  def addOne(from)
#    m.synchronize {
      @count += 1
      puts "Now got #@count from #{from}"
#    }
  end
end