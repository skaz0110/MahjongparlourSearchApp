class CommentsController < ApplicationController

  def index
     
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new  
    
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save

      # 投稿の詳細ページへ戻る
      redirect_to post_path(params[:post_id])
    else

      # 一つ前のページへ戻る
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @comment =Comment.find_by(id: params[:id],post_id: params[:post_id])
    
  end
  

  private
  def comment_params
    params.require(:comment).permit(:content,:star, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
