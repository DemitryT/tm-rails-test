class ApplicationController < ActionController::Base
  protect_from_forgery

  # Handle failed user authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_path
    flash[:error] = exception.message
  end

  def user_for_paper_trail
    current_admin_user ? current_admin_user.email : 'Unknown user'
  end
end
