class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to posts_url
    elsif user.nil?
        redirect_to error_url
    else
      flash.now[:danger] = 'Invalid credentials'
      render 'new'
    end
  end




  def destroy
    session.clear
    redirect_to login_url
  end
end
