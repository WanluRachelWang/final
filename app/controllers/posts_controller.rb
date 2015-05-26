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
      @posts = User.find_by(id:session["user_id"]).posts

    end

  end

  def create

    post = Post.new
    post.post_text = params[:post_text]
    post.rating = params[:rating]
    post.post_time = Time.now.to_datetime
    post.user_id = session[:user_id]

    if post.save
      place = Place.new
      place.post_id = post.id
      place.restaurant_id = params[:restaurant_id]

      if place.save
        redirect_to posts_url
        return
      end

    end

    redirect_to posts_url, notice: "Invalid Post"

  end

  def delete

  end

end