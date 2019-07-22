class Candidate < ApplicationRecord
  has_many :contributions, dependent: :destroy
  has_many :contributors, through: :contributions
  has_many :favorites, dependent: :destroy
  ##has_many :users, through: :favorites --??? aliases?? favorited_candidates?
  validates :first_name, presence: true

  scope :all_in_order, -> { order(last_name: :asc)}
  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }

  def full_name
    if self.last_name.present?
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end
end
