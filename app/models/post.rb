class Post < ApplicationRecord
	belongs_to :startup
	belongs_to :user
end
