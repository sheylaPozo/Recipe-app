# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user

  def change
    if self.is_public == true
      self.is_public = false
    else
      self.is_public = true
    end
  end
end
