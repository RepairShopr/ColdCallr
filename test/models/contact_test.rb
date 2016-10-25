# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  phone       :string(255)
#  status      :string(255)
#  user_id     :integer
#  properties  :text
#  created_at  :datetime
#  updated_at  :datetime
#  do_not_call :boolean          default(FALSE)
#  list_id     :integer
#  state       :string(255)
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
