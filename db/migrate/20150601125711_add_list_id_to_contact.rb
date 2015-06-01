class AddListIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :list_id, :integer
  end
end
