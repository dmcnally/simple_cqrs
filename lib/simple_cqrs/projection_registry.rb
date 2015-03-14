class SimpleCqrs::ProjectionRegistry
  
  include Singleton
  
  def initialize
    @projections = [ ]
  end  
  
  def register(projection)
    projections << projection
  end
  
  attr_reader :projections
  
end
  