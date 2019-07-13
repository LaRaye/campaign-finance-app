class Candidate < ApplicationRecord
  has_many :contributions
  has_many :contributors, through: :contributions
  has_many :favorites, dependent: :destroy
  ##has_many :users, through: :favorites --??? aliases?? favorited_candidates?
end
