class Parent
  @name
  @hoursofsleep
  
  attr_accessor :name
  attr_reader :hoursofsleep
  
  def initialize(name, hoursofsleep)
    @name = name
    @hoursofsleep = hoursofsleep
  
  end

end

joe = Parent.new(joe, 5)
bob = Parent.new(bob, 6)
mary = Parent.new(mary, 4)
