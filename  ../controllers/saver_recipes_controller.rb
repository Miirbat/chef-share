class SaverRecipesController < ApplicationController

  def new
      @saver_recipe = SaverRecipe.new
  end


  def create
    @recipe = Recipe.find_by(id: params[:saver_recipe][:saved_recipe_id])
    @saver_recipe = SaverRecipe.create(saver_id: params[:saver_recipe][:saver_id], saved_recipe_id: params[:saver_recipe][:saved_recipe_id])
    redirect_to recipe_path(@recipe)
    flash[:notice] = "Successfully saved #{@recipe.author.first_name}'s recipe #{@recipe.name} to your favorite recipes list"
  end


  def destroy
    @saver_recipe = SaverRecipe.find(params[:id])
    @recipe = Recipe.find_by_id(@saver_recipe.saved_recipe_id)
    @saver_recipe.destroy
    redirect_to recipe_path(@recipe)
    flash[:notice] = "Successfully removed #{@recipe.author.first_name}'s recipe #{@recipe.name} from your favorite recipes list"
  end



private
  def saver_recipe_params
    params.require(:saver_recipe).permit(:saver_id, :saved_recipe_id)
  end

end
