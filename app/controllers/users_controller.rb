class UsersController < ApplicationController

	before_action :find_user, :only => [:show, :edit, :update, :destroy]

	def find_user
		@user = User.find_by(id: params["id"])
	end

	def index
		@users = User.all
	end

	def new
		
	end

	def create
		user = User.new
		user.user_name = params["user_name"]
		user.password = params["password"]
		user.salt = params["salt"]
		user.profile_pic_path = params["profile_pic_path"]
		user.gender = params["gender"]
		user.id_created_time = Time.now.to_datetime
		user.nick_name = params["nick_name"]
		user.place = params["nick_name"]
		user.last_login_time = Time.now.to_datetime
		user.save
		redirect_to users_url
	end

	def destroy
		@user.delete
		redirect_to users_url
	end

	def show
		if @user == nil
			redirect_to users_url, notice: "User not found."
		end
	end

	def edit
		
	end

	def update
		@user.user_name = params["user_name"]
		@user.password = params["password"]
		@user.salt = params["salt"]
		@user.profile_pic_path = params["profile_pic_path"]
		@user.nick_name = params["nick_name"]
		@user.last_login_time = Time.now.to_datetime
		@user.save
		redirect_to users_url
	end


end