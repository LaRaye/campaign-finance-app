class Candidate < ApplicationRecord
  has_many :contributions
  has_many :contributors, through: :contributions
  has_many :favorites, dependent: :destroy
  ##has_many :users, through: :favorites --??? aliases?? favorited_candidates?
  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :all_in_order, -> { order(last_name: :asc)}

  def full_name
      self.first_name + " " + self.last_name
  end
end
