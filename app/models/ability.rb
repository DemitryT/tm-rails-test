class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    #  - Admin
    #  - Campaign manager

    # An admin can do everything
    if user.role?('admin')
      can :manage, :all
    end

    # A campaign manager can do the following:
    if user.role?('campaign_manager')
      can :manage, Campaign
      cannot :manage, [AdminUser, MobilePlatform]
    end

  end
end