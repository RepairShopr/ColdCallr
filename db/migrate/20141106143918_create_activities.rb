class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :contact_id
      t.text :notes

      t.timestamps
    end
  end
end
