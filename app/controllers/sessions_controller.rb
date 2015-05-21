class SessionsController < ApplicationController
	def new
    @user =User.new

	end
	def create
		user = User.find_by(user_name: params[:user_name])
    if user
      if user.password == params[:password]
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
