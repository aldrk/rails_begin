# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # can use in models & controllers
  helper_method :current_user

  def authenticate_user!
    puts current_user
    redirect_to login_path unless current_user
  end

  def current_user
    # cache
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
