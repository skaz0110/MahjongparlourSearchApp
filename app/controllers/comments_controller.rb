class CommentsController < ApplicationController

  before_action :login_check, only: [:index,:create]
  # 表示数
  PER_PAGE = 10

  def index

    @post = Post.find(params[:post_id])
    
    # 投稿詳細に関連付けてあるコメントを全取得　# ページネーション    
    @comments = @post.comments.page(params[:page]).order(created_at: :desc).per(PER_PAGE)

    # ログインユーザーに紐づくコメントを作成
    @comment = current_user.comments.new  

  end

  def create

    @comment = current_user.comments.new(comment_params)  

    @comment.save

    # 雀活ページにリダイレクト
    redirect_to post_comments_path(params[:post_id])

  end
    
  private
  def comment_params
    params.require(:comment).permit(:content,:post_id)
  end
  
end
