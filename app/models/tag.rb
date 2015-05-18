class Tag < ActiveRecord::Base
	has_many :marks
	has_many :users, :through => :marks
	validates_presence_of :tag_name
end
