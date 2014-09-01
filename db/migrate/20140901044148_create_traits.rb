class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
