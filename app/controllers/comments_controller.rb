class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    
  end
  
  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
