class AddChatroomIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :chatroom_id, :integer
  end
end
