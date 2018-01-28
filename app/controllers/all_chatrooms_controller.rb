class AllChatroomsController < ApplicationController
  def index
    render json: { room_ids: Chatroom.pluck(:id) }, status: 200
  end
end
