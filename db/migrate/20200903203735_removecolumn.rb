class Removecolumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :meal_entries, :user_id
    drop_table :users
  end
end
