class PostsController < ApplicationController
    def index
        
    end
    
      def show
        
        @post = Post.find(params[:id])
        
        # 投稿詳細に関連付けてあるコメントを全取得
        @comments = @post.comments  
        
        # 投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
        @comment = current_user.comments.new  

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
            redirect_back(fallback_location: root_path)  
        else
            
            #　コメント送信後は、一つ前のページへリダイレクトさせる。
            redirect_back(fallback_location: root_path) 
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
