# == Schema Information
#
# Table name: events
#
#  id             :bigint           not null, primary key
#  record_type    :string
#  event_type     :string
#  type_code      :integer
#  name           :string
#  tag            :string
#  message_stream :string
#  description    :string
#  email          :string
#  from           :string
#  bounced_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Event < ApplicationRecord
  include Notifiable

  SPAM_TYPE_CODE = 512

  def self.create_from_payload(payload)
    payload = payload.with_indifferent_access
    create(
      record_type: payload['RecordType'],
      event_type: payload['Type'],
      type_code: payload['TypeCode'],
      name: payload['Name'],
      tag: payload['Tag'],
      message_stream: payload['MessageStream'],
      description: payload['Description'],
      email: payload['Email'],
      from: payload['From'],
      bounced_at: payload['BouncedAt']
    )
  end

  def spam?
    type_code == SPAM_TYPE_CODE
  end
end
