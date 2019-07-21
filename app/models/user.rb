class User < ApplicationRecord
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :candidates, through: :favorites ##aliases??

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def favorite(candidate)
    self.favorites.find_or_create_by(candidate: candidate)
  end

  def unfavorite(candidate)
    self.favorites.where(candidate: candidate).destroy_all
    candidate.reload
  end

  def favorited?(candidate)
    self.favorites.find_by(candidate_id: candidate.id).present?
  end
end
