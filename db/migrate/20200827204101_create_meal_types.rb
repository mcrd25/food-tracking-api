class CreateMealTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_types do |t|
      t.string :name, null: false
      t.string :dsecription

      t.timestamps
    end
  end
end
