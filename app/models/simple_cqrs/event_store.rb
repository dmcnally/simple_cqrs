module SimpleCqrs
  class EventStore < ActiveRecord::Base
    
    self.table_name = 'simple_cqrs_events'
    
    serialize :values, JSON
    
  end
end
