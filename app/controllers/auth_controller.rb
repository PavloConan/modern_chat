class AuthController < ApplicationController
  before_action :check_user

  def new; end

  def create
    session[:username] = params[:username]
    redirect_to root_path
  end

  private

  def check_user
    redirect_to root_path if session[:username]
  end
  
end
