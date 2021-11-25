# frozen_string_literal: true

class FoodsController < ApplicationController
  def index
    @foods = Food.all.order(created_at: :desc)
    @current_user = current_user
    @measurement = [['kg', 'kg'], ['gramme', 'gramme'], ['unit', 'unit']]
  end

  def create
    @food = Food.new
    @food.user_id = current_user.id
    @food.name = params[:name]
    @food.measurement_unit = params[:measurement_unit]
    @food.price = params[:price]
    redirect_to(request.env['HTTP_REFERER'], notice: 'food created succesfully') if @food.save
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to(request.env['HTTP_REFERER'], notice: 'food deleted succesfully')
  end
end
