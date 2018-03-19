class Startup < ApplicationRecord

  belongs_to :sustage

  has_many :founderships
  has_many :users, through: :founderships

  has_many :startup_interests
  has_many :tag, through: :startup_interests

  has_many :posts
  
end
