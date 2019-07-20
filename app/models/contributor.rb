class Contributor < ApplicationRecord
  has_many :contributions
  has_many :candidates, through: :contributions

  validates :name, presence: true 
end
