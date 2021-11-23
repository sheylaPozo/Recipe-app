# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user
end
