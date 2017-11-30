class CreateSaverRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :saver_recipes do |t|
      t.references :saver
      t.references :saved_recipe
      t.timestamps
    end
  end
end
