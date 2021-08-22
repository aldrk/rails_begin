# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def authenticate_user!
    redirect_to login_path, alert: 'Verify your email and password' unless current_user

    cookies[:user_path] = request.method_symbol.eql?(:get) ? request.original_url : nil
  end

  def current_user
    # cache
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
