class PostsController < ApplicationController
    def index
        @posts = Post.all
        @post = Post.new
      end
    
      def show
        
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
        
        @shopdetails = ShopDetail.order(:id)
        
        if user_signed_in?
          
        else
          redirect_to user_session_path
        end
      end

      def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
          redirect_back(fallback_location: root_path)
        else
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
            params.require(:post).permit(:content)
        end
    
end
