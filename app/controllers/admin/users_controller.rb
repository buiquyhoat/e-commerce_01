class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :require_admin

  def index
    @search_user = User.paginate(page: params[:page],
      per_page: Settings.users_admin_per_page).search(params[:name],
      params[:email], params[:phone_number], params[:address])
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user && @user.destroy
      flash[:success] = t ".destroy_success",
        objects: t("activerecord.model.user")
    else
      flash[:danger] = t ".destroy_error",
        objects: t("activerecord.model.user")
    end
    redirect_to admin_users_url
  end
end
