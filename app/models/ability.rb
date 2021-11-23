# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    cannot :read, :inventories

    return unless user.present?

    can %i[read update destroy create], Recipe, user: user
    can %i[read update destroy create], Food, user: user
    can %i[read update destroy create], Inventory, user: user

    return unless user.role == 'admin'

    can :manage, :all
  end
end
