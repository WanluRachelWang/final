class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(user_name: params[:user_name])
    if user
      if user.password == params[:password]
        session["user_id"] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown password."

      end
    else
      redirect_to root_url, notice: "Unknown email."
    end
  end
end
