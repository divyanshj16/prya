class Startup < ApplicationRecord
  belongs_to :sustage
  has_many :founderships
  has_many :users, through: :founderships
end
