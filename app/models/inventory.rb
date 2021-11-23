class Inventory < ApplicationRecord
  has_many :inventory_foods
  belongs_to :user
end
