module SimpleCqrs
  module Processor
    
    def process(command, event_store: [])
      @event_store = event_store
      send(command.command_name, command) if self.respond_to?(command.command_name.to_sym)
    end
    
    private
    
    attr_reader :event_store
    
    def notify(event)
      event_store.append(event)
    end
    
    def next_id_for(command)
      # TODO: Turn this into a strategy.
      ::SimpleCqrs::CommandId.next(command.class.name)
    end
    
    attr_reader :events
  end
end
