# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  get '/recipes/my_recipes', to: 'recipes#my_recipes'
  get '/recipes/:recipe_id', to: 'recipes#show'
  post '/recipes/create', to: 'recipes#create'
  post '/recipes/destroy', to: 'recipes#destroy'
  get '/foods', to: 'foods#index'
  post '/foods/create', to: 'foods#create'
  post '/foods/destroy', to: 'foods#destroy'
  get '/inventories', to: 'inventories#index'
  get 'inventories/:inventory_id', to: 'inventories#show'
  post '/inventories/create', to: 'inventories#index'
  post '/inventories/destroy', to: 'inventories#destroy'
  get '/inventories/compare/:recipes_id/inventory_id', to: 'inventories#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
