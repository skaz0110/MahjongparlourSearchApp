class CommentsController < ApplicationController

  def index
    #@post = Post.find(params[:post_id])
    @comments = Comment.all
  end

  def create
    
  end
  
  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
