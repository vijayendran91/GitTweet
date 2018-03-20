class SessionsController < ApplicationController

  include  SessionsHelper
  def create
    if params[:session][:username]
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user_path(params[:session][:username])
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    else
      flash.now[:danger] = 'User not found. Please SignUp'
      redirect_to new_user_path
    end
  end

  def login
  end


  def destroy
    log_out
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:username,:password)
    end

end
