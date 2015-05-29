class FollowController < ApplicationController
	def followee_index
		user = User.find_by(:id => params[:id])
		@follow_users = user.followees
		render 'index'
	end

	def follower_index
		user = User.find_by(:id => params[:id])
		@follow_users = user.followers
		render 'index'
	end
	def index
		render 'index'
	end
	def create
		follow = Follow.new
		follow.user_id = session[:user_id]
		follow.follower_id = params[:id]
		follow.save
		redirect_to user_url(params[:id])
	end
	def destroy
		follow = Follow.find_by_user_id_and_follower_id(session[:user_id],params[:id])
		follow.delete
		redirect_to user_url(params[:id])
	end
end