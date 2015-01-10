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

  scope :is_open, -> { where("status = ? OR status = ?","New","Call Back").where(do_not_call: false) }
  scope :any_status, -> { where(do_not_call: false) }
  scope :is_new, -> { where("status != ? AND status != ?","New","Call Back").where(do_not_call: false)  }
  scope :is_callback, -> { where("status = ?","Call Back").where(do_not_call: false)  }

  POSSIBLE_STATUSES = [ 'New', 'Wrong Number', 'Do Not Call', 'Call Back', 'Left Message', 'Closed']
  before_validation :set_defaults

  def set_defaults
    self.status = "New" if status.blank?
    self.phone = phone.gsub(/\D/, '') if phone
  end

end
