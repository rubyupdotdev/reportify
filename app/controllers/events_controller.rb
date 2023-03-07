class EventsController < ApplicationController
  protect_from_forgery with: :null_session

  def report
    ProcessEventJob.perform_later payload_params

    head :ok
  end

  private

  def payload_params
    params.permit(%w(RecordType Type TypeCode Name Tag MessageStream Description Email From BouncedAt))
  end
end
