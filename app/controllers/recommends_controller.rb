class RecommendsController < ApplicationController

  # def create
  #   @post = Post.find(params[:post_id])
  #   @recommend = @post.recommends.new(recommend_params)
  #   @recommend.user = current_user
  #   if @recommend.save 
  #     flash[:success] = "You have recommended this post."
  #     redirect_to :back
  #   else
  #     render 'new'
  #   end
  # end

  # private
  # def recommend_params
  #   params.require(:recommend).permit(:post_id)
  # end

end
