class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, null: false
      t.integer :item_id
      t.string :response
      t.string :event_type
      t.string :par #string to record internal parameters
      t.timestamps
    end
    
    add_index :events, :user_id
  end
end
