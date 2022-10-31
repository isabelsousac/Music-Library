class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      # @user.email = @user.email.downcase!
      # @user.name = @user.name.capitalize!
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    # for admin only, grab all users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
