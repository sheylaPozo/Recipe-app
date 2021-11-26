# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(is_public: true).order(updated_at: :desc)
  end

  def new_recipe; end

  def show
    @current_user = current_user

    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.all
    @already_inside = @recipe_foods.pluck(:food_id)

    @food_options = Food.where.not(id: @already_inside)
    @inventories = Inventory.where(user_id: @current_user.id)
  end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def create
    if can? :create, @recipe
      @recipe = Recipe.new
      @recipe.user_id = current_user.id
      @recipe.name = params[:name]
      @recipe.preparation_time = params[:preparation_time]
      @recipe.cooking_time = params[:cooking_time]
      @recipe.description = params[:description]
      @recipe.is_public = params[:is_public] == '1'
      redirect_to('/recipes/my_recipes', notice: 'recipe created succesfully') if @recipe.save
    else
      redirect_to(request.env['HTTP_REFERER'], notice: 'you dont have access')
    end
  end

  def destroy
    if can? :destroy, @recipe
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      redirect_to(request.env['HTTP_REFERER'], notice: 'recipe deleted succesfully')
    else
      redirect_to(request.env['HTTP_REFERER'], notice: 'you dont have access')
    end
  end

  def change
    @recipe = Recipe.find(params[:recipe_id])
    if can? :update, @recipe
      @recipe.is_public = if @recipe.is_public
                            false
                          else
                            true
                          end
      @recipe.save
      redirect_to("/recipes/#{@recipe.id}", notice: 'recipe status to private succesfully')
    else
      redirect_to("/recipes/#{@recipe.id}", notice: 'you dont have access')
    end
  end

  def add
    @current_user = current_user
    @recipe = @current_user.recipes.find(params[:recipe_id])
    if can? :update, @recipe
      rec_food = RecipeFood.new
      @food = Food.find(params[:food])
      rec_food.recipe = @recipe
      rec_food.quantity = params[:quantity]
      rec_food.food = @food
      redirect_to(request.env['HTTP_REFERER']) if rec_food.save
    else
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def remove
    @recipe = current_user.recipes.find(params[:recipe_id])
    if can? :update, @recipe
      @current_user = current_user
      rec_food = RecipeFood.find(params[:rec_food_id])
      redirect_to(request.env['HTTP_REFERER']) if rec_food.destroy
    else
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def create_shopping_list
    @recipe = Recipe.find(params[:recipe_id])
    @inventory_id = params[:inventory]
    redirect_to("/inventories/compare/#{@recipe.id}/#{@inventory_id}")
  end
end
