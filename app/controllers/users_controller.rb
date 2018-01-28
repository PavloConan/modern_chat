class UsersController < ApplicationController

  def new
    render 'new', locals: {
      user: User.new
    }
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to chatroom_path('general')
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
