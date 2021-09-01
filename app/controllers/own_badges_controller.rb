class OwnBadgesController < ApplicationController
  before_action :set_own_badges, only: :index

  def index; end

  private

  def set_own_badges
    @own_badges = current_user.own_badges
  end
end