class Candidate < ApplicationRecord
  has_many :contributions
  has_many :contributors, through: :contributions
end
