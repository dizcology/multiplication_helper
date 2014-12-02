class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :user, null: false
      t.belongs_to :trait, null: false
      t.belongs_to :event, null: false
      t.boolean :result, null: false
      t.float :duration
      t.timestamps
    end
  end
end
