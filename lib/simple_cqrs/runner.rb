module SimpleCqrs::Runner

  require 'active_support/concern'
  
  extend ActiveSupport::Concern
  
  attr_writer :event_store

  def execute(command)
    load_configuration
    invoke_processors_for_command(command)
    store_generated_events
    invoke_projections_for_events
  end
  
  def project_events(events)
    load_configuration
    events.each do |raw_event| 
      project_event(event) 
    end
  end
  

  private

  module ClassMethods
    
    attr_reader :processor_definition_block, :projection_definition_block

    def define_processors(&block)
      @processor_definition_block = block
    end
    
    def define_projections(&block)
      @projection_definition_block = block
    end
    
  end

  attr_reader :processors, :projections, :generated_events

  def load_configuration
    @processors = [ ]
    @projections = [ ]
    @generated_events = [ ]
    instance_exec(&self.class.processor_definition_block)
    instance_exec(&self.class.projection_definition_block)
  end
  
  def invoke_processors_for_command(command)
    processors.each do |processor|
      processor.new.process(command, event_store: generated_events)
    end
  end
  
  def store_generated_events
    generated_events.each do |event|
      event_store.append(event)
    end
  end
  
  def invoke_projections_for_events
    generated_events.each do |event|
      project_event(event)
    end
  end
  
  def project_event(event)
    projections.each do |projection|
      projection.new.invoke(event)
    end
  end
  
  def register_processor(processor)
    @processors.append(processor)
  end
  
  def register_projection(projection)
    @projections.append(projection)
  end
  
  def event_store
    @event_store ||= ::SimpleCqrs::EventStore::ActiveRecordEventStore.new
  end

end
