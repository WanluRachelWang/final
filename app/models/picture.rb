class Picture < ActiveRecord::Base
	belongs_to :post
	validates_presence_of :post_id
	validates_presence_of :img_path
end
