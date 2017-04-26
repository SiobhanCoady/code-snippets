class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # if user.is_admin?
    #   can :manage, :all
    # end

    can [:edit, :update, :destroy], Snippet do |snippet|
      snippet.user == user
    end

  end
end
