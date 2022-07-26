class ApplicationController < ActionController::Base
  def dark_mode
    cookies[:dark_mode] = {
      value: 'dark mode on'
    }
    redirect_to root_path
  end

  def light_mode
    cookies.delete(:dark_mode)
    redirect_to root_path
  end
end
