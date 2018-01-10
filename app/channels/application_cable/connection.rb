module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :user_id

    def connect
      self.user_id = request.session.fetch("user_id", nil)
      reject_unauthorized_connection unless user_id
    end

  end
end
