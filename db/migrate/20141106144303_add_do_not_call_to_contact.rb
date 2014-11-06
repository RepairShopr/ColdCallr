class AddDoNotCallToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :do_not_call, :boolean, default: false
  end
end
