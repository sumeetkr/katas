class Singleton
  attr_accessor :value
  @@instance = Singleton.new()

  def self.get_instance()
   return @@instance
  end

  private_class_method :new
  def initialize
    @value = 0
  end
end