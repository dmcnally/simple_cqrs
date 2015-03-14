module SimpleCqrs::Event

  extend ActiveSupport::Concern
  
  included do 
    include Virtus.model
  end
  
  def event_name
    self.class.name.underscore
  end
  
end