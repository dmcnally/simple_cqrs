module SimpleCqrs
  class EventStore < ActiveRecord::Base
    
    self.table_name = 'events'
    
    serialize :values, JSON
    
  end
end
