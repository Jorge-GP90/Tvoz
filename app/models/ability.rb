# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # if user.admin?
    #   can :access, :rails_admin
    #   can :manage, :all
    # elsif user && user.role == (role = "teacher")
    #   can :manage, Task, :followed_id
    #   can :read, :all
    # else
    #   can :manage, Task, user_id: user.id 
    #   can :read, :all
    # end

    return unless user && user&.admin?
    
    can :access, :rails_admin
    can :manage, :all
  end
end