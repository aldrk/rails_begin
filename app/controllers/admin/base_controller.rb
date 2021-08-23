class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    puts current_user.type, "DBJUKABDHIIHSADHIJASDHIASIDH"
    redirect_to root_path, alert: 'You can`t see this pages' unless current_user.is_a?(Admin)
  end
end