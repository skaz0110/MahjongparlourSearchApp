class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    
    
    
    
    
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
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
