module SimpleCqrs
  module EventStore
    class ActiveRecordEventStore
      
      def append(event)
        ::Event.create!(name: event.class.name, values: event.attributes)
      end
      
    end
  end
end