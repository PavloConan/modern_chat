class ChatroomsController < ApplicationController
  before_action :authenticate!

  def show
    render 'show', locals: {
      chatroom: chatroom,
      message: Message.new,
      chatrooms: Chatroom.all
    }
  end

  private

  def authenticate!
    redirect_to login_path unless session[:user_id]
  end

  def chatroom
    Chatroom.find_by(slug: params[:slug])
  end
end
