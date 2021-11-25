# frozen_string_literal: true

class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @inventories = Inventory.where(user_id: @current_user.id)
    @inventory = Inventory.new
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
    description = temp[:description]
    name = temp[:name]
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

  def compare; end
end
