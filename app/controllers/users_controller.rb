class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @title = "Account"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome, and enjoy your stay!"
      redirect_to :root
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      sign_in @user
      redirect_to :root, notice: "Profile updated successfully"
    else
      render :edit
    end
  end

private

  def set_user
    @user = User.find_by_username(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end

protected

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
end
