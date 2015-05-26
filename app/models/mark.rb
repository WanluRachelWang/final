class Mark < ActiveRecord::Base
	belongs_to :user
	belongs_to :tag

	validates :user_id, :tag_id, presence: true
end
