module SendgridPostback
  module EventReceiver

    private

    # Including class should persist sendgrid_events and sendgrid_state
    # Serialize if using ActiveRecord
    attr_accessor :sendgrid_events
    attr_accessor :sendgrid_state
      
    def post_sendgrid_event event_data
      self.sendgrid_events ||= []
      self.sendgrid_events << event_data
      self.sendgrid_state = Event.sorted(sendgrid_events).last['event']
      after_create_sendgrid_event(event_data)
    end
    
    # Override hook as necessary
    def after_create_sendgrid_event(event_data)
    end

  end
  
end
