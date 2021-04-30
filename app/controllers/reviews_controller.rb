class ReviewsController < ApplicationController

  # 表示数
  PER_PAGE = 10

  def index
    
    @post = Post.find(params[:post_id])
    
    # 投稿詳細に関連付けてあるコメントを全取得 # ページネーション
    @reviews = @post.reviews.page(params[:page]).order(created_at: :desc).per(PER_PAGE)

  end
  
  def new 

    @post = Post.find(params[:post_id])
    @review = current_user.reviews.new

  end

  def create
    
    @review = current_user.reviews.new(review_params)
    @post = Post.find(params[:post_id])

    if @review.save

      # 投稿の詳細ページへ戻る
      redirect_to post_reviews_path(params[:post_id]), notice: "口コミを投稿しました"
    else

      # 画面遷移はなし　再入力を促す
      flash.now[:alert] = "口コミの投稿に失敗しました"
      render :new
    end

  end

  def destroy
    Review.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  # def edit
  #   @review =Review.find_by(id: params[:id],post_id: params[:post_id]) 
  # end

  private
  def review_params
    params.require(:review).permit(:content,:star, :post_id) 
  end

end
