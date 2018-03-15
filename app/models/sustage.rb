class Sustage < ApplicationRecord
  has_many :startups, dependent: :destroy
  validates :stage, presence: true, uniqueness: true
end
