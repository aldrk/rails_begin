class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:user_path] || tests_path
    else
      flash.now[:alert] = 'Verify your email and password'
      render :new
    end
  end
end
