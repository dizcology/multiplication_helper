class Dropitem < ActiveRecord::Migration
  def change
    remove_column :records, :item_id, :integer
  end
end
