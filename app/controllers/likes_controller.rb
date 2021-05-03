class LikesController < ApplicationController
  
  before_action :set_search
  
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

  private
  def set_search
    @q = Post.ransack(params[:q])
  end
end
