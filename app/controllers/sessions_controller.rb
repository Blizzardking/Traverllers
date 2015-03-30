class SessionsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    authenticated = user.authenticate(params[:session][:password])
    if (user && authenticated)
      log_in user
      redirect_to user
    else
      if !user
        flash.now[:danger] = 'Your account does not exist!'
      else
        flash.now[:danger] = 'Incorrect password!'
      end
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end
