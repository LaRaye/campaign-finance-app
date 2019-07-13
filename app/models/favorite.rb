class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :candidate, counter_cache: true 
end
