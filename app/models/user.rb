class User < ApplicationRecord
  has_secure_password
  has_many :messages
  validates :name, :password, :password_confirmation, presence: true
end
