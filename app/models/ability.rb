class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.vpr_admin? || user.kti_admin?
      can :manage, :all
      can :read, :all
    else
      can :read, :Manuscript
    end
  end

end
