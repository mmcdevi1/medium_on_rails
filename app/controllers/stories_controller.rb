class StoriesController < ApplicationController
  before_action :redirect

  def index
    @posts = current_user.posts.where(draft: true).all.order("created_at DESC")
  end

  def public
    @posts = current_user.posts.where(draft: false).all.order("created_at DESC")
  end

  private
  def redirect
    unless signed_in?
      redirect_to root_path
    end
  end

end
