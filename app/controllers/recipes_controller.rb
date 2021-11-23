# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(updated_at: :desc)
  end

  def show; end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def create; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(request.env['HTTP_REFERER'], notice: 'recipe deleted succesfully')
  end
end
