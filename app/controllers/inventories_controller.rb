# frozen_string_literal: true

class InventoriesController < ApplicationController
  def index
    @current_user = current_user
    @inventories = Inventory.where(user_id: @current_user.id)
  end

  def show; end

  def create; end

  def destroy; end

  def compare; end
end
