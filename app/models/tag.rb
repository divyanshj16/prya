class Tag < ApplicationRecord

  has_many :startup_interests
  has_many :startups, through: :startup_interests
  
end
