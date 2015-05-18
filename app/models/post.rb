class Post < ActiveRecord::Base
	belongs_to :user
	has_many :replys
	has_many :pictures
	has_many :likes
	validates_presence_of :user_id
	validates_presence_of :post_time
	validates_presence_of :post_text
	validates_presence_of :restaurant_name
	validates_presence_of :rating
end
