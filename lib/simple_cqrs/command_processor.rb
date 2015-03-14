module SimpleCqrs::CommandProcessor
  
  extend ActiveSupport::Concern
  
  module ClassMethods

    class Runner
      
      attr_reader :events

      def initialize
        @events = [ ]
      end
      
      def call(command, &block)
        instance_exec(command, &block)
      end
      

      private

      def event(event)
        ::Event.create!(name: event.class.name, values: event.to_hash)
        events << event
      end

      def next_id_for(command)
        # TODO: Turn this into a strategy.
        ::CommandId.next(command.class.name)
      end
      
    end

    def commands
      @_commands ||= { }
    end

    def process(command_klass, &block)
      commands[command_klass] = block
    end
    
    def invoke(command)
      block = commands[command.class]
      runner = Runner.new
      runner.call(command, &block)
      runner.events.each do |event|
        yield event
      end
    end
    
  end
  
end