class SessionsController < ApplicationController
	def new
    @user =User.new

	end
	def create
		user = User.find_by(user_name: params[:user_name])
    if user
      password_hash = Digest::MD5.hexdigest(Digest::MD5.hexdigest(params[:password])+Digest::MD5.hexdigest(user.salt))

      if user.password == password_hash
        session["user_id"] = user.id
        redirect_to root_url
      else
        @error = "Your password is wrong."
        redirect_to "/login", notice: "Unknown password."

      end
    else
      @error = "Unknown email."
      redirect_to "/login", notice: "Unknown email."
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to root_url
  end
end
