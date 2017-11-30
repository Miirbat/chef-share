class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :author_id
      t.integer :prep_time
      t.integer :cook_time
      t.text :instructions
      t.string :source

      t.timestamps
    end
  end
end
