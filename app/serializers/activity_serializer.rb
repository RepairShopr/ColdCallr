class ActivitySerializer < ApplicationSerializer
  attributes :id, :contact_id, :notes, :created_at, :user_name

  def created_at
    object.created_at.strftime("%m/%d/%Y %H:%M")
  end


  def user_name
    object.user.email.split("@")[0].titleize if object.user
  end
end
