class Tag < ApplicationRecord

  scope :find_tag, lambda {
    |str| where('lower(name) like ?', "#{str.downcase}%")
  }

  has_many :startup_interests
  has_many :startups, through: :startup_interests

end
