# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read update destroy create], Deductible, user: user
    can %i[read update destroy create], Category, user: user

    return unless user.role == 'admin'

    can :manage, :all
  end
end
