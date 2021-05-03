class UsersController < ApplicationController
  
  before_action :set_search
  
  def show
    @user = User.find(params[:id])
  end

  private
  def set_search
    @q = Post.ransack(params[:q])
  end
end
