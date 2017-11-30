class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :category
      t.string :food_group

      t.timestamps
    end
  end
end
