class SessionsController < ApplicationController
  before_action :no_need_for_login, only: [:new]

  def new
  end


  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboard_path
    else
      # Create an error message.
      flash.now[:danger] = 'Username o password incorrecto' #  quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end


end
