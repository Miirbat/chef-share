class AddColumnsToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :published, :boolean
    add_column :recipes, :vegetarian, :boolean
    add_column :recipes, :vegan, :boolean
    add_column :recipes, :gluten_free, :boolean
    add_column :recipes, :low_carb, :boolean
    add_column :recipes, :kosher, :boolean
    add_column :recipes, :halal, :boolean
  end
end
