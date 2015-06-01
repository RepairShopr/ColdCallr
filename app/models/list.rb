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

class List < ActiveRecord::Base
end
