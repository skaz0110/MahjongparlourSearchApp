class PostsController < ApplicationController
  
  PER_PAGE = 5

    def index

      # 検索結果の投稿を取得
      @q = Post.ransack(params[:q])
      @posts = @q.result.page(params[:page]).per(PER_PAGE)
            
    end

    def new
      
      @post = Post.new

    end

    def edit

      @post = Post.find(params[:id])

    end
    
    def update  
      @post = Post.find(params[:id])
      
      if @post.update(post_params)

        redirect_to posts_path, notice: "更新しました"
      
      else
        
        flash.now[:alert] = "更新に失敗しました"
        # エラーメッセ時を表示する
        render :edit
      
      end
    end

    def show
      
      @post = Post.find(params[:id])
      
      # 投稿詳細に関連付けてあるコメントを全取得
      @reviews = @post.reviews
      
      # 投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にReviewオブジェクトを取得
      @review = current_user.reviews.new  

      @shopdetails = ShopDetail.order(:id)
              
      if user_signed_in?
        
      else

          # ログインしてください
          redirect_to user_session_path
      end
    end

    def create
      
      @post = current_user.posts.new(post_params)
      
      if @post.save
        
          #　コメント送信後は、一つ前のページへリダイレクトさせる。
          redirect_to post_path(@post), notice: "投稿しました"
        
      else
          
          flash.now[:alert] = "投稿に失敗しました"
          #　コメント送信後は、一つ前のページへリダイレクトさせる。
          render :new
      end
    end
  
    private
      def post_params
          params.require(:post).permit(:content,:image,:title,:address,:phonenumber,:access,:openinghours,:regularholiday,:gamefree,:gameset)
      end
    
end
