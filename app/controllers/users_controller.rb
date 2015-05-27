class UsersController < ApplicationController

	before_action :find_user,  :only => [:show, :edit, :update, :destroy]
	#before_action :authorize,	:only => [:personal_show]
	def authorize
		@user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to root_url, notice: "Nice try!"
    end
	end
	def find_user
		@user = User.find_by(id: params["id"])
	end

	def index
		@users = User.all
	end

	def new
		@user = User.new
		flash.discard(:notice)
    render 'new'
	end
	
	def create
		@user = User.new
		@user.user_name = params["user_name"]
		@user.salt = ('0'..'z').to_a.shuffle.first(14).join
		@user.password = Digest::MD5.hexdigest(Digest::MD5.hexdigest(params["password"])+Digest::MD5.hexdigest(@user.salt))
		confirmation=Digest::MD5.hexdigest(Digest::MD5.hexdigest(params["repassword"])+Digest::MD5.hexdigest(@user.salt))
		@user.profile_pic_path = params["profile_pic_path"]
		@user.gender = params["gender"] == "1"
		@user.id_created_time = Time.now.to_datetime
		@user.nick_name = params["nick_name"]
		@user.place = params["nick_name"]
		@user.last_login_time = Time.now.to_datetime
		
		if @user.password == confirmation and @user.save
			session["user_id"] = @user.id
			redirect_to root_url
		else 
			if @user.password != confirmation
				flash[:notice]="password inconsistant."
				render 'new'
			else
				render 'new'
			end
		end
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
		@user.profile_pic_path = params["profile_pic_path"].present? ? params["profile_pic_path"] : "default-user-image.png"
		@user.nick_name = params["nick_name"]
		@user.last_login_time = Time.now.to_datetime
		@user.save
		redirect_to users_url
	end
	def follow
    follow = Follow.new
    follow.follower_id = params["id"]
    follow.user_id = session["user_id"]
    follow.save
    redirect_to user_url(params["id"])
  end

end