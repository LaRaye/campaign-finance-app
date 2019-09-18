class ContributionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :candidate_id, :contributor_id

  belongs_to :candidate
  belongs_to :contributor
end
