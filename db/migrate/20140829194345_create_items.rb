class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :content
      t.string :answer
      t.string :tag
      t.timestamps
    end
  end
end
