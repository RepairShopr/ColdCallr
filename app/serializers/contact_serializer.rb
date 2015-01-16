class ContactSerializer < ApplicationSerializer

  has_many :activities
  attributes :id, :name, :phone, :status, :user_id, :formatted_properties, :links,
             :city, :state

  def formatted_properties
    object.properties.keys.map {|k| {key: k, value: object.properties[k]}}
  end

  def links
    {
      external_contacts: "/api/contacts/#{object.id}/external_contacts"
    }
  end

  def city
    object.properties['city'] || object.properties[:city]
  end

  def state
    object.properties['state'] || object.properties[:state]
  end

end
