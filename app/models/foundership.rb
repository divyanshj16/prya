class Foundership < ApplicationRecord
  belongs_to :user
  belongs_to :startup, counter_cache: true
end
