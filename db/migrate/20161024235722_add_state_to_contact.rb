class AddStateToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :state, :string
  end
end
