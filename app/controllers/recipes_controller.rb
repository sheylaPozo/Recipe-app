# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(is_public: true).order(updated_at: :desc)
  end

  def new_recipe; end

  def show
    @recipe = Recipe.find(params[:recipe_id])
  end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def create
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
    @recipe.name = params[:name]
    @recipe.preparation_time = params[:preparation_time]
    @recipe.cooking_time = params[:cooking_time]
    @recipe.description = params[:description]
    if params[:is_public] == "1"
      @recipe.is_public = true
    else
      @recipe.is_public = false
    end
    redirect_to('/recipes/my_recipes', notice: 'recipe created succesfully') if @recipe.save
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(request.env['HTTP_REFERER'], notice: 'recipe deleted succesfully')
  end
end
