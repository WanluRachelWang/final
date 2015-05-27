class PostsController < ApplicationController

  before_action :require_user, :only => [:create, :destroy]
  before_action :set_page_id

  #set page id for menu tab
  def set_page_id
    @page_id = "posts"
  end

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
      @user = User.find_by(id:session["user_id"])

      #get first 10 posts
      @posts = @user.posts.order("post_time desc").limit(20)
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

  



  def destroy

    #only can delete user's own replies

    post = Post.find_by(id:params[:id])

    if post && post.user_id == session[:user_id]

      # delete all replies

      post.replies.each do |reply|
        reply.delete
      end

      post.delete

      redirect_to posts_url
    else
      redirect_to posts_url, notice: "Post delete failure"
    end
  end

end