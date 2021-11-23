# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.name = 'administrator'
user.email = 'Admin@example.com'
user.password = 'administrator'
user.role = 'admin'
user.skip_confirmation!
user.save!
6.times do |i|
  user = User.new
  user.name = "User ##{i + 1}"
  user.email = "test#{i + 1}@example.com"
  user.password = 'taawktljasktlw4aaglj'
  user.skip_confirmation!
  user.save!
  3.times do |j|
    Food.create(name: "Food ##{j + 1} of User##{i + 1}", measurement_unit: 'kg', user: user, price: 5)
  end
  3.times do |j|
    Recipe.create(name: "Recipe ##{j + 1} of User##{i + 1}", description: "Description ##{j + 1}", user: user,
                  preparation_time: 5, cooking_time: 5, public: true)
  end
  3.times do |j|
    Inventory.create(name: "Inventory ##{j + 1} of User##{i + 1}", description: "Description ##{j + 1}", user: user)
  end
end
