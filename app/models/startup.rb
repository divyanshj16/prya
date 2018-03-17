class Startup < ApplicationRecord

  belongs_to :sustage

  has_many :founderships
  has_many :users, through: :founderships

  has_many :startup_interests
  belongs_to :tag, through: :startup_interests
  
end
