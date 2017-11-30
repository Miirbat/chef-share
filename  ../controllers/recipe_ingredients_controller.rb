class RecipeIngredientsController < ApplicationController

  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  def new
    @recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe = Recipe.find_by_id(params[:recipe_ingredient][:recipe_id])
      if @recipe_ingredient.save
        redirect_to recipe_path(params[:recipe_ingredient][:recipe_id])
      else
        redirect_to recipe_path(@recipe)
        flash[:notice] = "Recipe ingredient was not complete so did not save"
      end
  end


  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end


  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to recipe_ingredient_path(@recipe_ingredient)
    else
      render :edit
    end
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe = @recipe_ingredient.recipe
    @recipe_ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :quantity, :units)
  end


end
