class CreateMealEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_entries do |t|
      t.references :meal_type, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.integer :calories

      t.timestamps
    end
  end
end
