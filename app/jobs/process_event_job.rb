class ProcessEventJob < ApplicationJob
  queue_as :default

  def perform(event_payload)
    event = Event.create_from_payload(event_payload)
    event.notify!
  end
end
