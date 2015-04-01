class SessionsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    
    if !@user
      flash.now[:danger] = 'Your account does not exist!'
      return render 'new'
    end
    if (@user.authenticate(params[:session][:password]))
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Incorrect password!'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end
