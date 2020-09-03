class AlterColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :meal_types, :dsecription, :description
  end
end
