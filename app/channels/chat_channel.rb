class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat#{params[:room]}"
  end

  def receive(payload)
    message = Message.create(
      user_id: user_id,
      text: payload["message"],
      chatroom_id: payload["chatroomId"]
    )
  end
end
