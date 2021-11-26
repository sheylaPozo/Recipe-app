# frozen_string_literal: true

class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @inventories = Inventory.where(user_id: @current_user.id)
  end

  def show
    @current_user = current_user

    @inventory = @current_user.inventories.find(params[:inventory_id])
    @inventory_foods = @inventory.inventory_foods.all
    @already_inside = @inventory_foods.pluck(:food_id)

    @food_options = Food.where.not(id: @already_inside)
  end

  def create
    @inventory = Inventory.new
    user = current_user
    temp = params[:inventory]
    description = params[:description]
    name = params[:name]
    @inventory.description = description
    @inventory.name = name
    @inventory.user_id = user.id
    @inventory.user_id

    redirect_to(request.env['HTTP_REFERER']) if @inventory.save
  end

  def add
    @current_user = current_user
    @inventory = @current_user.inventories.find(params[:inventory_id])
    if can? :update, @inventory
      inv_food = InventoryFood.new
      inv_food.inventory = @inventory
      inv_food.food = Food.find(params[:food])
      inv_food.quantity = params[:quantity]
      redirect_to(request.env['HTTP_REFERER']) if inv_food.save
    else
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def remove
    @inventory = current_user.inventories.find(params[:inventory_id])
    if can? :update, @inventory
      @current_user = current_user
      inv_food = InventoryFood.find(params[:inv_fod_id])
      redirect_to(request.env['HTTP_REFERER']) if inv_food.destroy
    else
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    if (can? :destroy, @inventory) && !@inventory.nil?
      @inventory.inventory_foods.each do |inventory_food|
        InventoryFood.delete_by(id: inventory_food.id)
      end
      @inventory.destroy
      redirect_to(request.env['HTTP_REFERER'], notice: 'Inventory deleted succesfully')
    else
      redirect_to(request.env['HTTP_REFERER'], notice: 'Not Access')
    end
  end

  def compare
    @result = []
    @amount = 0
    @total = 0
    @current_user = current_user
    @inventory = @current_user.inventories.find(params[:inventory_id])
    @recipe = Recipe.find(params[:recipes_id])
    if (can? :read, @recipe) && !@inventory.nil?
      @recipe.recipe_foods.each do |recipe_food|
        inventory_food = @inventory.inventory_foods.find_by(food_id: recipe_food.food.id)
        if !inventory_food.nil? && inventory_food.quantity < recipe_food.quantity

        hash = {}
        @amount += 1
        hash['name'] = recipe_food.food.name
        hash['quantity'] = recipe_food.quantity - inventory_food.quantity
        hash['unit'] = recipe_food.food.measurement_unit
        hash['price'] = hash['quantity'] * recipe_food.food.price
        @total += hash['price']
        @result.push(hash)
      else
        if inventory_food.nil?
          hash = {}
          @amount += 1
          hash['name'] = recipe_food.food.name
          hash['quantity'] = recipe_food.quantity
          hash['unit'] = recipe_food.food.measurement_unit
          hash['price'] = hash['quantity'] * recipe_food.food.price
          @total += hash['price']
          @result.push(hash)
        end
      end
    end
  else
    redirect_to(request.env['HTTP_REFERER'], notice: 'Not Access')
  end
  end
end
