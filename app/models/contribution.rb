class Contribution < ApplicationRecord
  belongs_to :candidate
  belongs_to :contributor

  def candidate_name=(candidate_name)
    first_name = candidate_name.split(" ")[0]
    last_name = candidate_name.split(" ")[1]
    self.candidate = Candidate.find_or_create_by(first_name: first_name, last_name: last_name)
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
end
