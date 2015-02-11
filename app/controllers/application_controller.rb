class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Por Favor Identificate."
      redirect_to login_url
    end
  end

  def admin_zone
    unless is_admin?
      redirect_to dashboard_path
      flash[:danger] = "No tienes los suficientes permisos."
    end
  end


  def no_need_for_login
    redirect_to dashboard_path if logged_in?
  end

end
