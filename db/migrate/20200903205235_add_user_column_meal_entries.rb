class AddUserColumnMealEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :meal_entries, :users, null: false, foreign_key: true
  end
end
