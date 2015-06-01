class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
