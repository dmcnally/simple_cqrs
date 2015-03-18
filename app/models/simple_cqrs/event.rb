module SimpleCqrs
  class Event < ActiveRecord::Base
    
    serialize :values, JSON
    
  end
end
