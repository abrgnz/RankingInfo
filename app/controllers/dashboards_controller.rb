class DashboardsController < ApplicationController
  before_action :logged_in_user
  def index
    @trials = Trial.mine(session[:user_id],session[:user_privileges]).limit(5).order(:created_at)
    @tasks =  Task.task_not_done(session[:user_id],session[:user_privileges]).limit(5).order(:created_at)
  end
end
