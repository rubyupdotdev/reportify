module Notifiable
  extend ActiveSupport::Concern

  def notifiable?
    spam?
  end

  def notify!
    return unless notifiable?

    if spam?
      slack_client.chat_postMessage(channel: SLACK_CHANNEL, text: "Spam from #{email}", as_user: true)
    end
  end

  def slack_client
    @slack_client ||= Slack::Web::Client.new(token: SLACK_OAUTH_TOKEN)
  end
end
