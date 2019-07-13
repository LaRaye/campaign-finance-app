class User < ApplicationRecord
  has_many :favorites
  has_many :candidates, through: :favorites 
end
