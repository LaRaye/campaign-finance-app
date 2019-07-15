class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    #what page after sign in, if @user.save?
  end

  def destroy
  end 

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
