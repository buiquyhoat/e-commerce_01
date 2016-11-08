class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def verify_user
    unless logged_in?
      store_location
      flash[:danger] = t ".please_log_in"
      redirect_to login_url
    end
  end

  def correct_user
    load_user
    redirect_to root_url unless is_user? @user
  end

  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end
