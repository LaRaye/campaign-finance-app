class SessionsController < ApplicationController
  def home
    render :home
  end

  def login
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:login_error] = "Sorry, your username or password was incorrect."
      redirect_to '/login'
    end
  end

  def fb_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = auth['uid'] #secure random hex
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def logout
    session.clear
    redirect_to '/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
