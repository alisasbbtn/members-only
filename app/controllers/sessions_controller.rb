class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'welcome back.'
      redirect_to root_path
    else
      flash.now[:danger] = 'invalid email/password.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'succesfully logged out.'
    redirect_to root_path
  end
end
