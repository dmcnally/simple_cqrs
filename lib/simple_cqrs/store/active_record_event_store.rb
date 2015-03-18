module SimpleCqrs
  module Store
    class ActiveRecordEventStore
      
      def append(event)
        ::SimpleCqrs::EventStore.create!(name: event.class.name, values: event.attributes)
      end
      
    end
  end
end