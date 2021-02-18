class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    
    # 投稿詳細に関連付けてあるコメントを全取得
    @comments = @post.comments  
  end

  def create
    
  end
  
  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
