module SimpleCqrs::Projection

  def invoke(event)
    send(event.event_name, event) if self.respond_to?(event.event_name.to_sym)
  end
  
end