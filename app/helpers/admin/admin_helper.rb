module Admin::AdminHelper
  def require_admin
    redirect_to root_path unless logged_in? && current_user.admin?
  end
end
