class Post < ActiveRecord::Base
	belongs_to :user
	has_many :replys
	has_many :pictures
	has_many :likes

	validates :user_id, :post_time, :post_text, :rating, presence: true, allow_nil: false
end
