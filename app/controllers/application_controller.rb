class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ProductsHelper
  include Admin::AdminHelper

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
    redirect_to root_url unless @user.is_user? current_user
  end

  def verify_admin
    redirect_to root_url unless current_user.admin?
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash.now[:warning] = t "category.not_found"
      render_404
    end
  end
end
