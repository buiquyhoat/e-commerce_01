class UsersController < ApplicationController
  before_action :load_user, only: [:show]
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
