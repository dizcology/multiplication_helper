class Modifyrecord < ActiveRecord::Migration
  def change
    add_column :records, :trait_id, :integer
    remove_column :records, :item_id
  end
end
