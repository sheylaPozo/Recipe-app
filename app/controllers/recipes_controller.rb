# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(is_public: true).order(updated_at: :desc)
  end

  def show; end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def new; end

  def create
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
    temp = params[:recipe]
    @recipe.name = temp[:name]
    @recipe.preparation_time = temp[:preparation_time]
    @recipe.cooking_time = temp[:cooking_time]
    @recipe.description = temp[:description]
    @recipe.is_public = temp[:is_public]
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(request.env['HTTP_REFERER'], notice: 'recipe deleted succesfully')
  end
end
