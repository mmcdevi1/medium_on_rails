class PostsController < ApplicationController
  before_action :set_posts, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  layout :post_layout
  
  def index
    @posts = Post.where(draft: false).order("created_at DESC")
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
      render 'edit'
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

  def upvote 
    @post = Post.find(params[:id])
    @recommend = @post.recommends.new
    @recommend.user = current_user
    if Recommend.where(user_id: current_user.id, post_id: @post.id).any?
      redirect_to :back
      flash[:danger] = "You can only recommend once."
    else
      @recommend.save
      redirect_to :back
      flash[:success] = "You have recommended this article."
    end
  end

  def downvote
    @post = Post.find(params[:id])
    @recommend = Recommend.where(user_id: current_user.id, post_id: @post.id).first
    @recommend.destroy
    redirect_to :back
  end

  private
  def set_posts
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :attachment, :draft, :subtitle)
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
    elsif params[:action] == 'show' 
      'post_show'
    end
  end

end






































