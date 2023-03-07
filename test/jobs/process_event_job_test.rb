require "test_helper"

class ProcessEventJobTest < ActiveJob::TestCase
  test 'creates an event record with passed payload and notifies for spam' do
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
      "BouncedAt": "2023-02-27T21:41:30Z"
    }

    assert_difference 'Event.count' do
      Slack::Web::Client.any_instance.expects(:chat_postMessage)
      ProcessEventJob.perform_now payload
    end
  end

  test 'creates an event record with passed payload and does not notify for hard bounce' do
    payload = {
      "RecordType": "Bounce",
      "MessageStream": "outbound",
      "Type": "HardBounce",
      "TypeCode": 1,
      "Name": "Hard bounce",
      "Tag": "Test",
      "Description": "The server was unable to deliver your message (ex: unknown user, mailbox not found).",
      "Email": "arthur@example.com",
      "From": "notifications@example.io",
      "BouncedAt": "2019-11-05T16:33:54.9070259Z",
    }

    assert_difference 'Event.count' do
      Slack::Web::Client.any_instance.expects(:chat_postMessage).never
      ProcessEventJob.perform_now payload
    end
  end
end
