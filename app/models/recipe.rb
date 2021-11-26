# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user

  def change
    self.is_public = is_public != true
  end
end