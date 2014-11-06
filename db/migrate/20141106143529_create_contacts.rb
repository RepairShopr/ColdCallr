class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :status
      t.integer :user_id
      t.text :properties

      t.timestamps
    end
  end
end
