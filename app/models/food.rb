# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  has_many :inventory_foods

  validates :name, :measurement_units, :price, presence: true

  def total_price
    foods.sum(&:price)
  end
end
