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
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
