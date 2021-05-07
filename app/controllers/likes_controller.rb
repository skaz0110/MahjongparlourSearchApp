class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    @post = Post.find(params[:id])

    Like.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    Like.find_by(user_id: current_user.id, post_id: @post.id).destroy
  end
end
