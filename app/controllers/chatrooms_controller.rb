class ChatroomsController < ApplicationController
  before_action :authenticate!

  def new
    render :new, locals: {
      chatroom: Chatroom.new
    }
  end

  def create
    chatroom = Chatroom.new(chatroom_params)
    chatroom.slug = chatroom.topic.downcase
    if chatroom.save
      redirect_to chatroom_path(chatroom.slug)
    end
  end

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

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
