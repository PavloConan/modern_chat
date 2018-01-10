class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Invalid credentials'
      render :new
    end
  end

end