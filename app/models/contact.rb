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
#

class Contact < ActiveRecord::Base
  serialize :properties, Hash

  has_many :activities

  validates_uniqueness_of :phone

  before_validation :set_defaults

  def set_defaults
    self.status = "New" if status.blank?
    self.phone = phone.gsub(/\D/, '') if phone
  end

end
