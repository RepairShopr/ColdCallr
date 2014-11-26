class ContactSerializer < ApplicationSerializer


  embed :ids, include: true
  has_many :activities
  attributes :id, :name, :phone, :status, :user_id, :properties, :links

  def properties
    object.properties.keys.map {|k| {key: k, value: object.properties[k]}}
  end

  def links
    {
      external_contacts: "/api/contacts/#{object.id}/external_contacts"
    }
  end

end
