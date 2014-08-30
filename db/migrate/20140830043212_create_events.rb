class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.integer :item_id
      t.string :response
      t.string :event_type
      t.timestamps
    end
    
    add_index :events, :user_id
  end
end
