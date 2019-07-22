class Contributor < ApplicationRecord
  has_many :contributions, dependent: :destroy
  has_many :candidates, through: :contributions

  validates :name, presence: true
end
