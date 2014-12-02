class CreateUserTraits < ActiveRecord::Migration
  def change
    create_table :user_traits do |t|
      t.belongs_to :user, null: false
      t.belongs_to :trait, null: false
      t.integer :n, default: 0
      t.float :value, default: 0.0
      t.timestamps
    end
  end
end
