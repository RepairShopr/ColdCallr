# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Activity < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
end
