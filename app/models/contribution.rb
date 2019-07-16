class Contribution < ApplicationRecord
  belongs_to :candidate
  belongs_to :contributor

  def candidate_name=(name)
    self.candidate = Candidate.find_or_create_by(name: name)
  end

  def candidate_name
    self.candidate ? self.candidate.new : nil
  end
end
