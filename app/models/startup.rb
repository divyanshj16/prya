class Startup < ApplicationRecord

  belongs_to :sustage

  has_many :users, through: :foundership
  has_many :founders, foreign_key: 'startup_id', class_name: 'Foundership'

  has_many :startup_interests
  has_many :tags, through: :startup_interests

  has_many :posts

  has_many :presentations

  def add_tag! name, user
    name.downcase!
    name.gsub!(/\s/, '')
    tag = Tag.find_by_name name
    if !tag
      tag = Tag.create! name: name
    end
    if !self.tags.include? tag
      self.tags << tag
      save!
    end
  end

  def remove_tag! name, user
    tag = Tag.find_by_name name
    if self.tags.include? tag
      self.tags.delete(tag)
      save!
    end
  end

  acts_as_followable
end
