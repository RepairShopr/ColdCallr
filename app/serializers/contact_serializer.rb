class ContactSerializer < ApplicationSerializer
  embed :ids, include: true
  has_many :activities
  attributes :id, :name, :phone, :status, :user_id, :properties
end
