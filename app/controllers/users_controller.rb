class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :verify_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome_to_the_Fshop"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".profile_updated"
      redirect_to @user
    else
      flash.now[:danger] = t ".update_failed"
      render :edit
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    render_404 unless @user
  end
end
