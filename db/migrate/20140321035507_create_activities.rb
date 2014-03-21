class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :object_id, null: false
      t.string :object_type, null: false
      t.string :name, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :activities, :object_id
    add_index :activities, :object_type
    add_index :activities, :user_id
  end
end
