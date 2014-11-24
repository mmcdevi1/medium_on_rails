class PostsController < ApplicationController
  before_action :set_posts, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  layout :post_layout
  
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post created."
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated."
      redirect_to @post
    else
      render 'edit'
    end 
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to :back
  end

  private
  def set_posts
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def correct_user
    @post = Post.find(params[:id])
    unless current_user == @post.user
      redirect_to root_path
      flash[:danger] = "You can't do that."
    end
  end

  def post_layout
    if params[:action] == 'new' || params[:action] == 'edit'
      'posts_form'
    end
  end

end






































