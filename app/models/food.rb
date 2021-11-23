# frozen_string_literal: true

class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods
  belongs_to :user
end
