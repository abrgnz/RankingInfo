module SessionsHelper

  def log_in(user)
   session[:user_id] = user.id
   session[:user_privileges] = user.privileges
   session[:user_name] = user.name
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
   session.delete(:user_id)
   @current_user = nil
  end

  def is_admin?
    session[:user_privileges] == "1"
  end

  def countAssignedTrials
    Trial.mine(session[:user_id],session[:privileges]).count
  end

  def countAssignedTasks
    Task.task_not_done(session[:user_id],session[:privileges]).count
  end
end
