class CreateTraits < ActiveRecord::Migration
  def change
    drop_table :traits
    create_table :traits do |t|
      t.string :name
      t.timestamps
    end
    
    
    
  end
end
