class Post < ActiveRecord::Base
	belongs_to :user
	has_many :replys
	has_many :pictures
	has_many :likes
	
end
