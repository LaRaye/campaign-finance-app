class Contribution < ApplicationRecord
  belongs_to :candidate
  belongs_to :contributor
end
