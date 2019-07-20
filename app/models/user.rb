class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :candidates, through: :favorites ##aliases??

  validates :username, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
