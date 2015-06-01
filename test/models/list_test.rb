# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  enabled    :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
