class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.boolean :result, null: false
      t.timestamps
    end
  end
end
