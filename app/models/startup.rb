class Startup < ApplicationRecord
  has_many :founderships
  has_many :users, through: :founderships
end
