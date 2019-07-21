class Contribution < ApplicationRecord
  belongs_to :candidate, optional: true
  belongs_to :contributor, optional: true

  after_commit :assign_size

  validates :amount, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :date, presence: true, format: {with: /\d{2}\/\d{2}\/\d{4}/}
  validates :candidate_name, presence: true
  validates :contributor_name, presence: true

  scope :all_by_date, -> { order(date: :desc)}

  def candidate_name=(candidate_name)
    if !candidate_name.nil? && candidate_name != ""
      first_name = candidate_name.split(" ")[0]
      last_name = candidate_name.split(" ")[1]
      self.candidate = Candidate.find_or_create_by(first_name: first_name, last_name: last_name)
    end
  end

  def candidate_name
    self.candidate ? (self.candidate.first_name + " " + self.candidate.last_name) : nil
  end

  def contributor_name=(contributor_name)
    self.contributor = Contributor.find_or_create_by(name: contributor_name)
  end

  def contributor_name
    self.contributor ? self.contributor.name : nil
  end

  def assign_size
    if self.amount > 199
      self.size = "Large"
    else
      self.size = "Small"
    end
  end
end
