class ContributorSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :industry_affiliation

  has_many :contributions
  has_many :candidates, through: :contributions 
end
