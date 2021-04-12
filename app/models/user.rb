class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 24 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum: 16 }
end
