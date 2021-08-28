class SessionsController < Devise::SessionsController
  after_action :after_login, only: :create

  private

  def after_login
    flash[:notice] = current_user.sign_in_count.eql?(1) ? "Hello, #{user_name}" : t(:signed_in)
  end
end