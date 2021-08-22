# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url
    link_to 'GitHub', 'https://github.com/aldrk/rails_begin', target: '_blank'
  end

  def header_menu(current_user)
    if current_user
      render partial: 'shared/user', locals: { user: current_user, session: session }
    else
      link_to 'Log in', login_path
    end
  end

  def show(flash)
    content_tag :p, flash.now[:alert], class: 'flash alert' if flash[:alert]
  end
end
