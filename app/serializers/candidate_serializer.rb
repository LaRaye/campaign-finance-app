class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :party_affiliation, :office_position, :location, :platform_outline, :favorites_count

  has_many :contributions
  has_many :contributors, through: :contributions
  has_many :favorites
end
