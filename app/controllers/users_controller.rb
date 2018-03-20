class UsersController < ApplicationController

  def new
    @user=User.new
  end


  def create
    @user = User.new(user_params)
   if @user.save
     flash[:success]="Successfully Signed up"
     redirect_to users_path
   else
     flash[:danger] = "Invalid username/password combination."
     redirect_to(:action => "new")
   end
  end


  def index
      
  end

private
  def user_params
    params.require(:user).permit(:username,:fname,:lname,:email,:password,:password_confirmation,:dob)
  end


end
