class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from "chat"
  end

  def send_message(payload)
    message = Message.new(user_id: user_id, text: payload["message"])
    if message.save
      ActionCable.server.broadcast "chat", message: render(message)
    end
  end

  private

  def render(message)
    ApplicationController.new.helpers.c("message", message: message)
  end

end
