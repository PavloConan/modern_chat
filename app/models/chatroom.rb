class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def name_hashtagged
    "##{topic.downcase}"
  end
end
