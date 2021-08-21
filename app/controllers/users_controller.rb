class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  # what we can send to model
  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end