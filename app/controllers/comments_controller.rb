class CommentsController < ApplicationController
  def index
    
  end

  def new
  end

  def show
  end

  # def create
  #   @comment = Comment.new(comment_params)
  #   @comment.user_id = current_user.id
    
  #   if @comment.save
  #     redirect_back(fallback_location: root_path)
  #   else
  #     redirect_back(fallback_location: root_path)
  #   end

  # end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # private
  # def comment_params
  #   params.require(:comment).permit(:content)
  # end
end
