class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_create_commit { MessageBroadcastJob.perform_now(self) }
end
