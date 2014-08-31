class Addpartoevent < ActiveRecord::Migration
  def change
    add_column :events, :par, :string #a string to record internal parameters
  end
end
