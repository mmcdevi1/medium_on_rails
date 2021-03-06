class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user 
      flash[:success] = "You are logged in."
    else 
      flash[:danger] = "Incorrect email/password combination."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
