module SessionsHelper

  def log_in(user)
    session[:username]=user.username
    set_current_user user
  end

  def current_user
    @current_user ||= User.find_by(username: session[:username])
    
  end

  def logged_in?
    !@current_user.nil?
  end

  def set_current_user(user)
    @current_user = user
  end

  def log_out
    session.delete(:username)
    @current_user=nil
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
