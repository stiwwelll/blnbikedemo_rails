class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id

    if user.nil?
      can :read, Comment
    elsif user.admin?
      can :manage, :all
    else
      can [:read, :create], Comment
      can [:update, :destroy], Comment, :user_id => user.id
    end
  end
end
