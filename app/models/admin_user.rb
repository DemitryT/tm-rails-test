class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  # order matters because of the comparison in the role? method
  ROLES = %w[admin campaign_manager]

  def role?(base_role)
    return false unless role
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

end
