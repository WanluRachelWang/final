class TagsController < ApplicationController
	def create
		tag=Tag.find_by(:tag_name => params['tag'])
			if not tag.nil?
				mark = Mark.new
				mark.user_id=@user.id
				mark.tag_id=tag.id
				mark.save
			end
	end
	def delete
		tag=Tag.find_by(:tag_name => params['tag'])
		Mark.find_by(:tag_id => tag.id).delete
		
	end
end