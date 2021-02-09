class HomesController < ApplicationController
  
  # 1ページの表示数
  PER_PAGE = 9

  def index
    if user_signed_in?
            
      # 投稿一覧を表示させるために全取得
      # @posts = current_user.posts.all
      
      # 投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得  
      # @post = current_user.posts.new  

      @q = Post.ransack(params[:q])
      @posts = @q.result.page(params[:page]).per(PER_PAGE)
    
    else
      
      redirect_to new_user_session_path

    end
  end
  
end
