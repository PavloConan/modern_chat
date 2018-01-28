class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat#{message.chatroom_id}", message: render(message), chatroomId: message.chatroom_id
  end

  private

  def render(message)
    ApplicationController.new.helpers.c("message", message: message)
  end
end
