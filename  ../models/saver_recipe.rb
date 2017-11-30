class SaverRecipe < ApplicationRecord
  belongs_to :saved_recipe, :class_name => "Recipe", :foreign_key => :saved_recipe_id
  belongs_to :saver, :class_name => "User", :foreign_key => :saver_id



end
