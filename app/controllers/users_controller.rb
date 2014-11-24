class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
  end

  def show
    @posts = @user.posts.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "Successfully registered with Medium."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user 
    else 
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User was deleted."
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
