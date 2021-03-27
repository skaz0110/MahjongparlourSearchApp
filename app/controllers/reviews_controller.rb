class ReviewsController < ApplicationController

  def index
     
    @post = Post.find(params[:post_id])
    @review = current_user.reviews.new  
    
  end

  def create
    @review = current_user.reviews.new(review_params)
    
    if @review.save

      # 投稿の詳細ページへ戻る
      redirect_to post_path(params[:post_id])
    else

      # 一つ前のページへ戻る
      flash.now[:alert] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    
  end

  def destroy
    Review.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @review =Review.find_by(id: params[:id],post_id: params[:post_id]) 
  end

  private
  def review_params
    params.require(:review).permit(:content,:star, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
