class UsersController < ApplicationController

  def new
    @user=User.new
  end


  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user.user_name)

  end


private
  def user_params
    params.require(:user).permit(:username,:fname,:lname,:email,:password,:password_confirmation,:dob)
  end


end
