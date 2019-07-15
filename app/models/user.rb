class User < ApplicationRecord
  has_secure_password
  
  has_many :favorites
  has_many :candidates, through: :favorites ##aliases??
end
