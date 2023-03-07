require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'enqueues a ProcessEventJob for reported event' do
    payload = {
      "RecordType": "Bounce",
      "Type": "SpamNotification",
      "TypeCode": 512,
      "Name": "Spam notification",
      "Tag": "",
      "MessageStream": "outbound",
      "Description": "The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.",
      "Email": "zaphod@example.com",
      "From": "notifications@example.io",
      "BouncedAt": "2023-02-27T21:41:30Z",
    }

    assert_enqueued_with(job: ProcessEventJob) do
      post events_report_path, params: payload, as: :json
      assert_response :success
    end
  end
end
