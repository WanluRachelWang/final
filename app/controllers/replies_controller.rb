class RepliesController < ApplicationController

  before_action :require_user, :only => [:create, :delete]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to log in"
    end
  end

  def create


  end

  def delete

  end

end