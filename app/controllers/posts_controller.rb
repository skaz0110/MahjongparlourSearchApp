class PostsController < ApplicationController
    def index
        if user_signed_in?
            # @posts = current_user.posts.all  #投稿一覧を表示させるために全取得
            # @post = current_user.posts.new   #投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得    
            @posts = Post.all
            @post = Post.new
        else
          redirect_to new_user_session_path
        end
        
      end
    
      def show
        
        @post = Post.find(params[:id])
        @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
        @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得

        @shopdetails = ShopDetail.order(:id)
               
        if user_signed_in?
          
        else
          redirect_to user_session_path
        end
      end

      def create
        
        @post = current_user.posts.new(post_params)
        if @post.save
          redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
        else
          redirect_back(fallback_location: root_path)  #同上
        end
      end
    
      def new_guest
        user = User.find_or_create_by(email: 'guest@example.com') do |user|
          user.password = SecureRandom.urlsafe_base64
          # user.name = "ゲストユーザー"
      end
        sign_in user
        
        redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
      end

      private
        def post_params
            params.require(:post).permit(:content,:image,:title)
        end
    
end
