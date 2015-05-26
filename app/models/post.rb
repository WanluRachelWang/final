class Post < ActiveRecord::Base
	belongs_to :user
	has_many :replies
	has_many :pictures
	has_many :likes
  has_one :place
  has_one :restaurant, through: :place

	validates :user_id, :post_time, :post_text, :rating, presence: true, allow_nil: false
end
