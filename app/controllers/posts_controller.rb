class PostsController < ApplicationController

  before_action :require_user, :only => [:create, :delete]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to log in"
    end
  end

  def index
    #if user has logged in, read user's posts and user's friends posts
    #if not, read recommend posts

    if session[:user_id].blank?

    else
      @restaurants = Restaurant.all

    end

  end

  def create

  end

  def delete

  end

end